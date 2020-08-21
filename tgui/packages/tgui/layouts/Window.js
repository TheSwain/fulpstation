/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { classes } from 'common/react';
import { useDispatch } from 'common/redux';
import { decodeHtmlEntities, toTitleCase } from 'common/string';
import { Component, Fragment } from 'inferno';
import { backendSuspendStart, useBackend } from '../backend';
import { Icon } from '../components';
import { UI_DISABLED, UI_INTERACTIVE, UI_UPDATE } from '../constants';
<<<<<<< HEAD
import { useDebug } from '../debug';
import { toggleKitchenSink } from '../debug/actions';
import { dragStartHandler, recallWindowGeometry, resizeStartHandler, setWindowKey } from '../drag';
import { createLogger } from '../logging';
import { Layout } from './Layout';
=======
import { toggleKitchenSink, useDebug } from '../debug';
import { dragStartHandler, recallWindowGeometry, resizeStartHandler, setWindowKey } from '../drag';
import { createLogger } from '../logging';
import { useDispatch } from '../store';
import { Layout, refocusLayout } from './Layout';
>>>>>>> fulpmaster

const logger = createLogger('Window');

const DEFAULT_SIZE = [400, 600];

export class Window extends Component {
  componentDidMount() {
    const { config, suspended } = useBackend(this.context);
    if (suspended) {
      return;
    }
    logger.log('mounting');
    const options = {
      size: DEFAULT_SIZE,
      ...config.window,
    };
    if (this.props.width && this.props.height) {
      options.size = [this.props.width, this.props.height];
    }
<<<<<<< HEAD
    if (config.window?.key) {
      setWindowKey(config.window.key);
    }
    recallWindowGeometry(options);
=======
    setWindowKey(config.window.key);
    recallWindowGeometry(config.window.key, options);
    refocusLayout();
>>>>>>> fulpmaster
  }

  render() {
    const {
      resizable,
      theme,
      title,
      children,
    } = this.props;
    const {
      config,
      suspended,
    } = useBackend(this.context);
    const { debugLayout } = useDebug(this.context);
    const dispatch = useDispatch(this.context);
    const fancy = config.window?.fancy;
    // Determine when to show dimmer
<<<<<<< HEAD
    const showDimmer = config.user && (
      config.user.observer
        ? config.status < UI_DISABLED
        : config.status < UI_INTERACTIVE
    );
=======
    const showDimmer = config.user.observer
      ? config.status < UI_DISABLED
      : config.status < UI_INTERACTIVE;
>>>>>>> fulpmaster
    return (
      <Layout
        className="Window"
        theme={theme}>
        <TitleBar
          className="Window__titleBar"
          title={!suspended && (title || decodeHtmlEntities(config.title))}
          status={config.status}
          fancy={fancy}
          onDragStart={dragStartHandler}
          onClose={() => {
            logger.log('pressed close');
            dispatch(backendSuspendStart());
          }} />
        <div
          className={classes([
            'Window__rest',
            debugLayout && 'debug-layout',
          ])}>
          {!suspended && children}
          {showDimmer && (
            <div className="Window__dimmer" />
          )}
        </div>
        {fancy && resizable && (
          <Fragment>
            <div className="Window__resizeHandle__e"
              onMousedown={resizeStartHandler(1, 0)} />
            <div className="Window__resizeHandle__s"
              onMousedown={resizeStartHandler(0, 1)} />
            <div className="Window__resizeHandle__se"
              onMousedown={resizeStartHandler(1, 1)} />
          </Fragment>
        )}
      </Layout>
    );
  }
}

const WindowContent = props => {
  const {
    className,
    fitted,
    children,
    ...rest
  } = props;
<<<<<<< HEAD
=======
  // A bit lazy to actually write styles for it,
  // so we simply include a Box with margins.
>>>>>>> fulpmaster
  return (
    <Layout.Content
      className={classes([
        'Window__content',
        className,
      ])}
      {...rest}>
      {fitted && children || (
        <div className="Window__contentPadding">
          {children}
        </div>
      )}
    </Layout.Content>
  );
};

Window.Content = WindowContent;

const statusToColor = status => {
  switch (status) {
    case UI_INTERACTIVE:
      return 'good';
    case UI_UPDATE:
      return 'average';
    case UI_DISABLED:
    default:
      return 'bad';
  }
};

const TitleBar = (props, context) => {
  const {
    className,
    title,
    status,
    fancy,
    onDragStart,
    onClose,
  } = props;
  const dispatch = useDispatch(context);
  return (
    <div
      className={classes([
        'TitleBar',
        className,
      ])}>
      {status === undefined && (
        <Icon
          className="TitleBar__statusIcon"
          name="tools"
          opacity={0.5} />
      ) || (
        <Icon
          className="TitleBar__statusIcon"
          color={statusToColor(status)}
          name="eye" />
      )}
      <div className="TitleBar__title">
        {typeof title === 'string'
          && title === title.toLowerCase()
          && toTitleCase(title)
          || title}
      </div>
      <div
        className="TitleBar__dragZone"
        onMousedown={e => fancy && onDragStart(e)} />
      {process.env.NODE_ENV !== 'production' && (
        <div
          className="TitleBar__devBuildIndicator"
          onClick={() => dispatch(toggleKitchenSink())}>
          <Icon name="bug" />
        </div>
      )}
      {!!fancy && (
        <div
          className="TitleBar__close TitleBar__clickable"
          // IE8: Synthetic onClick event doesn't work on IE8.
          // IE8: Use a plain character instead of a unicode symbol.
          // eslint-disable-next-line react/no-unknown-property
          onclick={onClose}>
          {Byond.IS_LTE_IE8 ? 'x' : '×'}
        </div>
      )}
    </div>
  );
};
