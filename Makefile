KERNEL := rokaspetraviius/yolo-detector-filament-segmentation-2026-v6
COMPETITION := filament-segmentation-2026

.PHONY: deploy status submissions

deploy:
	kaggle kernels push -p .

status:
	kaggle kernels status $(KERNEL)

submissions:
	kaggle competitions submissions -c $(COMPETITION)
