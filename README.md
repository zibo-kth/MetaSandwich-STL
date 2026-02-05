# MetaSandwich-STL — Sound Transmission Loss (STL) toolbox for metamaterial / sandwich panels (MATLAB)

MetaSandwich-STL is a MATLAB toolbox for computing **sound transmission loss (STL)** of plates and sandwich / metamaterial-inspired panel concepts.

- Primary focus: research/engineering workflows (parameter sweeps, STL curves, helper utilities)
- Origin: refactored + renamed from the legacy project **STransLAMP**

> Legacy note / 兼容说明
> - The legacy entrypoint `STransLAMP_Main.m` is kept for backward compatibility.
> - The recommended entrypoint is `MetaSandwich_STL_Main.m`.

## Quick start (MATLAB)

```matlab
% From repo root:
MetaSandwich_STL_Main();
```

If you have older scripts, this still works:

```matlab
STransLAMP_Main();
```

## Structure

- `src/` core functions (STL, impedances, helper formulas)
- `materials/`, `data/` example datasets / material properties
- `legacy/` older scripts kept for reproducibility
- `docs/` documentation (including legacy readme)

## Conventions

- Default air properties used in helper formulas (when needed):
  - `c0 = 343 m/s`, `rho0 = 1.2 kg/m^3` (can be parameterized later)

## Citation

If you use this code in academic work, please cite the repository (see `CITATION.cff`) and any relevant papers.

## License

BSD-3-Clause (see `LICENSE`).
