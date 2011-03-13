module guip.size;

alias Size!(int) ISize;
alias Size!(float) FSize;

struct Size(T)
{
  T width, height;

  @property bool empty() const {
    return this.width > 0 && this.height > 0;
  }

  /**
   * Returns a new size whose width/height is multiplied/divided by
   * the scalar.
   */
  const Size!T opBinary(string op)(in T val) const
    if (op == "*" || op == "/")
  {
    T width = mixin("this.width" ~ op ~ "val");
    T height = mixin("this.height" ~ op ~ "val");
    return Size!T(width, height);
  }
}
