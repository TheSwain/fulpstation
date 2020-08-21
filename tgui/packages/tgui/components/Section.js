/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
import { canRender, classes } from 'common/react';
import { Component, createRef } from 'inferno';
import { addScrollableNode, removeScrollableNode } from '../events';
import { computeBoxClassName, computeBoxProps } from './Box';

export class Section extends Component {
  constructor(props) {
    super(props);
    this.ref = createRef();
    this.scrollable = props.scrollable;
  }

  componentDidMount() {
    if (this.scrollable) {
      addScrollableNode(this.ref.current);
    }
  }
=======
import { classes, isFalsy, pureComponentHooks } from 'common/react';
import { computeBoxClassName, computeBoxProps } from './Box';

export const Section = props => {
  const {
    className,
    title,
    level = 1,
    buttons,
    fill,
    children,
    ...rest
  } = props;
  const hasTitle = !isFalsy(title) || !isFalsy(buttons);
  const hasContent = !isFalsy(children);
  return (
    <div
      className={classes([
        'Section',
        'Section--level--' + level,
        fill && 'Section--fill',
        className,
        ...computeBoxClassName(rest),
      ])}
      {...computeBoxProps(rest)}>
      {hasTitle && (
        <div className="Section__title">
          <span className="Section__titleText">
            {title}
          </span>
          <div className="Section__buttons">
            {buttons}
          </div>
        </div>
      )}
      {hasContent && (
        <div className="Section__content">
          {children}
        </div>
      )}
    </div>
  );
};
>>>>>>> fulpmaster

  componentWillUnmount() {
    if (this.scrollable) {
      removeScrollableNode(this.ref.current);
    }
  }

  render() {
    const {
      className,
      title,
      level = 1,
      buttons,
      fill,
      fitted,
      scrollable,
      children,
      ...rest
    } = this.props;
    const hasTitle = canRender(title) || canRender(buttons);
    const hasContent = canRender(children);
    return (
      <div
        ref={this.ref}
        className={classes([
          'Section',
          'Section--level--' + level,
          Byond.IS_LTE_IE8 && 'Section--iefix',
          fill && 'Section--fill',
          fitted && 'Section--fitted',
          scrollable && 'Section--scrollable',
          className,
          ...computeBoxClassName(rest),
        ])}
        {...computeBoxProps(rest)}>
        {hasTitle && (
          <div className="Section__title">
            <span className="Section__titleText">
              {title}
            </span>
            <div className="Section__buttons">
              {buttons}
            </div>
          </div>
        )}
        {fitted && children
          || hasContent && (
            <div className="Section__content">
              {children}
            </div>
          )}
      </div>
    );
  }
}
