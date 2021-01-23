Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239E93015B8
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 15:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbhAWONT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 09:13:19 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:58703 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbhAWONQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 09:13:16 -0500
Received: from [172.23.56.21] ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6H7o-1l5WXd17rk-006fmg; Sat, 23 Jan 2021 15:10:29 +0100
Message-ID: <806583c6db1070d903e709302f73ff29e2d500b0.camel@richard-neumann.de>
Subject: Re: [PATCH v9 7/8] Refactored platform driver
From:   Richard Neumann <mail@richard-neumann.de>
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        corbet@lwn.net, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 23 Jan 2021 15:10:27 +0100
In-Reply-To: <20210123134716.13414-8-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
         <20210123134716.13414-8-mail@richard-neumann.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J2UGGm4uG8TSsL6LoV6EG+H97eG2iqDPBspPUgIFFraoxLePbVy
 VPpso9R6qlyS8Dg5DPPZxxbJQBn4Muq0+4mDW+gBZuonzV69k2KcKZB1cLnXs+3xdCoUR+r
 xFLERc7WOVv9jOn7PvZLhIIrccZplYUq/UjScD8yf5AusTIxs4VTpcOKOJYkNaulykBBLtu
 89NvU4cLciLw5plWoW9mQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S2urQDbkso4=:j+e2j4r7wpFSyA4uJ8AW+v
 3uA3ibPpg1CKVrLnlW1pahCVwHe/Lm0msprcAiU2JU25xeqFDWjNZaG30TXLbbS70irGy1S1O
 Pg/p6s99HWHt2SuqevwkUfOcmshLIeuB4aWykSndKHKLTyIIE9WAKSrv1DdmLQiCbwK3R5umm
 aKlEy0R4yIA3k2e9qFwgbeyENtB8m0o20N6NMcC7T6RwuMRVxEFGgACOMam3YwBPUHeO8z4mQ
 8OoEA1YakSsQSDRsvQudB5p8VJqogdBjWJseFP+pHmIImJWnTS5edStYeEeVUifQ49F98xzIg
 QybobJs5XzSi52QNbPwJLLBbFbWsMB6BKD3VOFCYqha62h/94PHJcwVByqaFq+UUyhzkdppmc
 37MxbMLCHXqijXTvwxq3YQzsUCbk9ov8j9Ltour/uAxAXWRJ00VYzbZT/NDsuEbLbZc0PW3O5
 WThQW1ap4w==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The patch also includes the introduction of module parameters to e.g.
override the sensor mask, since this is necessary on devices, where
there is no information about the connected sensors in the P2C
registers of the PCI device, such as my HP ENVY x360 Convertible 13-
ag0xxx.
See https://bugzilla.kernel.org/show_bug.cgi?id=199715

Am Samstag, dem 23.01.2021 um 14:47 +0100 schrieb
mail@richard-neumann.de:
> From: Richard Neumann <mail@richard-neumann.de>
> 
> Refactored the AMD SFH platform driver to initialize the HIDs with
> additional meta data, such as the sensor name, HUB name and bus type.
> 
> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> ---
>  drivers/hid/amd-sfh-hid/amd-sfh-plat.c   | 327
> +++++++++++++++++++++++
>  drivers/hid/amd-sfh-hid/amd-sfh-plat.h   |  38 +++
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 246 -----------------
>  3 files changed, 365 insertions(+), 246 deletions(-)
>  create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-plat.c
>  create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-plat.h
>  delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_client.c
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-plat.c
> b/drivers/hid/amd-sfh-hid/amd-sfh-plat.c
> new file mode 100644
> index 000000000000..16427e7891fe
> --- /dev/null
> +++ b/drivers/hid/amd-sfh-hid/amd-sfh-plat.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + *  AMD Sensor Fusion Hub HID platform driver
> + *
> + *  Authors: Nehal Bakulchandra Shah
> <Nehal-Bakulchandra.Shah@amd.com>
> + *           Richard Neumann <mail@richard-neumann.de>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include "amd-sfh-hid-ll-drv.h"
> +#include "amd-sfh-hid-reports.h"
> +#include "amd-sfh-plat.h"
> +
> +#define AMD_SFH_HID_VENDOR     0x3fe
> +#define AMD_SFH_HID_PRODUCT    0x0001
> +#define AMD_SFH_HID_VERSION    0x0001
> +#define AMD_SFH_PHY_DEV                "AMD Sensor Fusion Hub
> (PCIe)"
> +#define AMD_SFH_ALL_SENSORS    (ACCEL_MASK + GYRO_MASK + MAGNO_MASK
> + ALS_MASK)
> +
> +/* Module parameters */
> +static uint sensor_mask_override;
> +static ushort sensor_update_interval = 200;
> +
> +module_param_named(sensor_mask, sensor_mask_override, uint, 0644);
> +MODULE_PARM_DESC(sensor_mask, "override the detected sensors mask");
> +module_param_named(interval, sensor_update_interval, ushort, 0644);
> +MODULE_PARM_DESC(interval, "override the sensor update interval");
> +
> +/**
> + * get_sensor_name - Returns the name of a sensor by its index.
> + * @sensor_idx:        The sensor's index
> + *
> + * Returns the name of the respective sensor.
> + */
> +static char *amd_sfh_get_sensor_name(enum sensor_idx sensor_idx)
> +{
> +       switch (sensor_idx) {
> +       case ACCEL_IDX:
> +               return "accelerometer";
> +       case GYRO_IDX:
> +               return "gyroscope";
> +       case MAG_IDX:
> +               return "magnetometer";
> +       case ALS_IDX:
> +               return "ambient light sensor";
> +       default:
> +               return "unknown sensor type";
> +       }
> +}
> +
> +/**
> + * amd_sfh_hid_poll - Updates the input report for a HID device.
> + * @work:      The delayed work
> + *
> + * Polls input reports from the respective HID devices and submits
> + * them by invoking hid_input_report() from hid-core.
> + */
> +static void amd_sfh_hid_poll(struct work_struct *work)
> +{
> +       struct amd_sfh_hid_data *hid_data;
> +       struct hid_device *hid;
> +       size_t size;
> +       u8 *buf;
> +
> +       hid_data = container_of(work, struct amd_sfh_hid_data,
> work.work);
> +       hid = hid_data->hid;
> +       size = get_descriptor_size(hid_data->sensor_idx,
> AMD_SFH_INPUT_REPORT);
> +
> +       buf = kzalloc(size, GFP_KERNEL);
> +       if (!buf)
> +               goto reschedule;
> +
> +       size = get_input_report(hid_data->sensor_idx, 1, buf, size,
> +                               hid_data->cpu_addr);
> +       if (size < 0) {
> +               hid_err(hid, "Failed to get input report!\n");
> +               goto free_buf;
> +       }
> +
> +       hid_input_report(hid, HID_INPUT_REPORT, buf, size, 0);
> +
> +free_buf:
> +       kfree(buf);
> +reschedule:
> +       schedule_delayed_work(&hid_data->work, hid_data->interval);
> +}
> +
> +/**
> + * amd_sfh_hid_probe - Initializes the respective HID device.
> + * @pci_dev:           The underlying PCI device
> + * @sensor_idx:                The sensor index
> + *
> + * Sets up the HID driver data and the corresponding HID device.
> + * Returns a pointer to the new HID device or NULL on errors.
> + */
> +static struct hid_device *amd_sfh_hid_probe(struct pci_dev *pci_dev,
> +                                           enum sensor_idx
> sensor_idx)
> +{
> +       int rc;
> +       char *name;
> +       struct hid_device *hid;
> +       struct amd_sfh_hid_data *hid_data;
> +
> +       hid = hid_allocate_device();
> +       if (IS_ERR(hid)) {
> +               pci_err(pci_dev, "Failed to allocate HID device!\n");
> +               goto err_hid_alloc;
> +       }
> +
> +       hid_data = devm_kzalloc(&pci_dev->dev, sizeof(*hid_data),
> GFP_KERNEL);
> +       if (!hid_data)
> +               goto destroy_hid_device;
> +
> +       hid_data->sensor_idx = sensor_idx;
> +       hid_data->pci_dev = pci_dev;
> +       hid_data->hid = hid;
> +       hid_data->cpu_addr = NULL;
> +       hid_data->interval = sensor_update_interval;
> +
> +       INIT_DELAYED_WORK(&hid_data->work, amd_sfh_hid_poll);
> +
> +       hid->bus = BUS_I2C;
> +       hid->group = HID_GROUP_SENSOR_HUB;
> +       hid->vendor = AMD_SFH_HID_VENDOR;
> +       hid->product = AMD_SFH_HID_PRODUCT;
> +       hid->version = AMD_SFH_HID_VERSION;
> +       hid->type = HID_TYPE_OTHER;
> +       hid->ll_driver = &amd_sfh_hid_ll_driver;
> +       hid->driver_data = hid_data;
> +
> +       name = amd_sfh_get_sensor_name(sensor_idx);
> +
> +       rc = strscpy(hid->name, name, sizeof(hid->name));
> +       if (rc >= sizeof(hid->name))
> +               hid_warn(hid, "Could not set HID device name.\n");
> +
> +       rc = strscpy(hid->phys, AMD_SFH_PHY_DEV, sizeof(hid->phys));
> +       if (rc >= sizeof(hid->phys))
> +               hid_warn(hid, "Could not set HID device
> location.\n");
> +
> +       rc = hid_add_device(hid);
> +       if (rc) {
> +               hid_err(hid, "Failed to add HID device: %d\n", rc);
> +               goto free_hid_data;
> +       }
> +
> +       return hid;
> +
> +free_hid_data:
> +       devm_kfree(&pci_dev->dev, hid_data);
> +destroy_hid_device:
> +       hid_destroy_device(hid);
> +err_hid_alloc:
> +       return NULL;
> +}
> +
> +/**
> + * amd_sfh_plat_get_sensor_mask - Returns the sensors mask.
> + * @pci_dev:   The SFH PCI device
> + *
> + * Gets the sensor mask from the PCI device.
> + * Optionally overrides that value with the value provided by the
> + * kernel parameter `sensor_mask_override`.
> + * If sensors were specified, that the SFH fundamentally does not
> + * support, it logs a warning to the kernel ring buffer.
> + */
> +static uint amd_sfh_plat_get_sensor_mask(struct pci_dev *pci_dev)
> +{
> +       uint invalid_sensors;
> +       uint sensor_mask = amd_sfh_get_sensor_mask(pci_dev);
> +
> +       if (sensor_mask_override > 0)
> +               sensor_mask = sensor_mask_override;
> +
> +       pci_info(pci_dev, "Sensor mask: %#04x\n", sensor_mask);
> +
> +       invalid_sensors = ~AMD_SFH_ALL_SENSORS & sensor_mask;
> +       if (invalid_sensors)
> +               pci_warn(pci_dev, "Invalid sensors: %#04x\n",
> invalid_sensors);
> +
> +       return sensor_mask;
> +}
> +
> +/**
> + * init_hid_devices - Initializes the HID devices.
> + * @privdata:  The platform device data
> + *
> + * Matches the sensors's masks against the sensor mask retrieved
> + * from amd_sfh_plat_get_sensor_mask().
> + * In case of a match, it instantiates a corresponding HID device
> + * to process the respective sensor's data.
> + */
> +static void amd_sfh_init_hid_devices(struct amd_sfh_plat_dev
> *privdata)
> +{
> +       struct pci_dev *pci_dev;
> +       uint sensor_mask;
> +
> +       pci_dev = privdata->pci_dev;
> +       sensor_mask = amd_sfh_plat_get_sensor_mask(pci_dev);
> +
> +       if (sensor_mask & ACCEL_MASK)
> +               privdata->accel = amd_sfh_hid_probe(pci_dev,
> ACCEL_IDX);
> +       else
> +               privdata->accel = NULL;
> +
> +       if (sensor_mask & GYRO_MASK)
> +               privdata->gyro = amd_sfh_hid_probe(pci_dev,
> GYRO_IDX);
> +       else
> +               privdata->gyro = NULL;
> +
> +       if (sensor_mask & MAGNO_MASK)
> +               privdata->magno = amd_sfh_hid_probe(pci_dev,
> MAG_IDX);
> +       else
> +               privdata->magno = NULL;
> +
> +       if (sensor_mask & ALS_MASK)
> +               privdata->als = amd_sfh_hid_probe(pci_dev, ALS_IDX);
> +       else
> +               privdata->als = NULL;
> +}
> +
> +/**
> + * remove_hid_devices - Removes all active HID devices.
> + * @privdata:  The platform device data
> + *
> + * Destroys all initialized HID devices.
> + */
> +static void remove_hid_devices(struct amd_sfh_plat_dev *privdata)
> +{
> +       if (privdata->accel)
> +               hid_destroy_device(privdata->accel);
> +
> +       privdata->accel = NULL;
> +
> +       if (privdata->gyro)
> +               hid_destroy_device(privdata->gyro);
> +
> +       privdata->gyro = NULL;
> +
> +       if (privdata->magno)
> +               hid_destroy_device(privdata->magno);
> +
> +       privdata->magno = NULL;
> +
> +       if (privdata->als)
> +               hid_destroy_device(privdata->als);
> +
> +       privdata->als = NULL;
> +}
> +
> +/**
> + * amd_sfh_platform_probe - Probes the AMD SFH platform driver
> + * @pdev:      The platform device
> + *
> + * Initializes the client data and invokes initialization of HID
> devices.
> + * Returns 0 on success and nonzero on errors.
> + */
> +static int amd_sfh_platform_probe(struct platform_device *pdev)
> +{
> +       struct amd_sfh_plat_dev *privdata;
> +       struct pci_dev *pci_dev;
> +
> +       privdata = devm_kzalloc(&pdev->dev, sizeof(*privdata),
> GFP_KERNEL);
> +       if (!privdata)
> +               return -ENOMEM;
> +
> +       pci_dev = pci_get_device(PCI_VENDOR_ID_AMD,
> PCI_DEVICE_ID_AMD_SFH, NULL);
> +       if (!pci_dev) {
> +               dev_err(&pdev->dev, "No matching PCI device
> found!\n");
> +               return -ENODEV;
> +       }
> +
> +       privdata->pci_dev = pci_dev;
> +       platform_set_drvdata(pdev, privdata);
> +       amd_sfh_init_hid_devices(privdata);
> +       return 0;
> +}
> +
> +/**
> + * amd_sfh_platform_remove - Removes AMD SFH platform driver
> + * @pdev:      The platform device
> + *
> + * Removes the HID devices and unloads the driver.
> + * Returns 0 on success and nonzero on errors.
> + */
> +static int amd_sfh_platform_remove(struct platform_device *pdev)
> +{
> +       struct amd_sfh_plat_dev *privdata;
> +
> +       privdata = platform_get_drvdata(pdev);
> +       if (!privdata)
> +               return -EINVAL;
> +
> +       remove_hid_devices(privdata);
> +       return 0;
> +}
> +
> +static const struct acpi_device_id amd_sfh_acpi_match[] = {
> +       { "AMDI0080" },
> +       { },
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, amd_sfh_acpi_match);
> +
> +static struct platform_driver amd_sfh_platform_driver = {
> +       .probe = amd_sfh_platform_probe,
> +       .remove = amd_sfh_platform_remove,
> +       .driver = {
> +               .name = "amd-sfh-hid",
> +               .acpi_match_table = amd_sfh_acpi_match,
> +       },
> +};
> +
> +module_platform_driver(amd_sfh_platform_driver);
> +
> +MODULE_DESCRIPTION("AMD(R) Sensor Fusion Hub HID platform driver");
> +MODULE_AUTHOR("Nehal Shah <nehal-bakulchandra.shah@amd.com>");
> +MODULE_AUTHOR("Richard Neumann <mail@richard-neumann.de>");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-plat.h
> b/drivers/hid/amd-sfh-hid/amd-sfh-plat.h
> new file mode 100644
> index 000000000000..97350ded2797
> --- /dev/null
> +++ b/drivers/hid/amd-sfh-hid/amd-sfh-plat.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + *  AMD Sensor Fusion Hub platform interface
> + *
> + *  Authors: Nehal Bakulchandra Shah
> <Nehal-Bakulchandra.Shah@amd.com>
> + *           Richard Neumann <mail@richard-neumann.de>
> + */
> +
> +#ifndef AMD_SFH_PLAT_H
> +#define AMD_SFH_PLAT_H
> +
> +#include <linux/bits.h>
> +#include <linux/hid.h>
> +#include <linux/list.h>
> +#include <linux/pci.h>
> +
> +#define ACCEL_MASK     BIT(ACCEL_IDX)
> +#define GYRO_MASK      BIT(GYRO_IDX)
> +#define MAGNO_MASK     BIT(MAG_IDX)
> +#define ALS_MASK       BIT(ALS_IDX)
> +
> +/**
> + * struct amd_sfh_plat_dev - Platform device data
> + * @pci_dev:           The handled AMD SFH PCI device
> + * @accel:             The HID device of the accelerometer
> + * @gyro:              The HID device of the gyroscope
> + * @magno:             The HID device of the magnetometer
> + * @als:               The HID device of the ambient light sensor
> + */
> +struct amd_sfh_plat_dev {
> +       struct pci_dev *pci_dev;
> +       struct hid_device *accel;
> +       struct hid_device *gyro;
> +       struct hid_device *magno;
> +       struct hid_device *als;
> +};
> +
> +#endif
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> deleted file mode 100644
> index 2ab38b715347..000000000000
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *  AMD SFH Client Layer
> - *  Copyright 2020 Advanced Micro Devices, Inc.
> - *  Authors: Nehal Bakulchandra Shah
> <Nehal-Bakulchandra.Shah@amd.com>
> - *          Sandeep Singh <Sandeep.singh@amd.com>
> - */
> -
> -#include <linux/dma-mapping.h>
> -#include <linux/hid.h>
> -#include <linux/list.h>
> -#include <linux/slab.h>
> -#include <linux/workqueue.h>
> -#include <linux/errno.h>
> -
> -#include "hid_descriptor/amd_sfh_hid_desc.h"
> -#include "amd_sfh_pcie.h"
> -#include "amd_sfh_hid.h"
> -
> -#define AMD_SFH_IDLE_LOOP      200
> -
> -struct request_list {
> -       struct hid_device *hid;
> -       struct list_head list;
> -       u8 report_id;
> -       u8 sensor_idx;
> -       u8 report_type;
> -       u8 current_index;
> -};
> -
> -static struct request_list req_list;
> -
> -void amd_sfh_set_report(struct hid_device *hid, int report_id,
> -                       int report_type)
> -{
> -       struct amdtp_hid_data *hid_data = hid->driver_data;
> -       struct amdtp_cl_data *cli_data = hid_data->cli_data;
> -       int i;
> -
> -       for (i = 0; i < cli_data->num_hid_devices; i++) {
> -               if (cli_data->hid_sensor_hubs[i] == hid) {
> -                       cli_data->cur_hid_dev = i;
> -                       break;
> -               }
> -       }
> -       amdtp_hid_wakeup(hid);
> -}
> -
> -int amd_sfh_get_report(struct hid_device *hid, int report_id, int
> report_type)
> -{
> -       struct amdtp_hid_data *hid_data = hid->driver_data;
> -       struct amdtp_cl_data *cli_data = hid_data->cli_data;
> -       int i;
> -
> -       for (i = 0; i < cli_data->num_hid_devices; i++) {
> -               if (cli_data->hid_sensor_hubs[i] == hid) {
> -                       struct request_list *new =
> kzalloc(sizeof(*new), GFP_KERNEL);
> -
> -                       if (!new)
> -                               return -ENOMEM;
> -
> -                       new->current_index = i;
> -                       new->sensor_idx = cli_data->sensor_idx[i];
> -                       new->hid = hid;
> -                       new->report_type = report_type;
> -                       new->report_id = report_id;
> -                       cli_data->report_id[i] = report_id;
> -                       cli_data->request_done[i] = false;
> -                       list_add(&new->list, &req_list.list);
> -                       break;
> -               }
> -       }
> -       schedule_delayed_work(&cli_data->work, 0);
> -       return 0;
> -}
> -
> -static void amd_sfh_work(struct work_struct *work)
> -{
> -       struct amdtp_cl_data *cli_data = container_of(work, struct
> amdtp_cl_data, work.work);
> -       struct request_list *req_node;
> -       u8 current_index, sensor_index;
> -       u8 report_id, node_type;
> -       u8 report_size = 0;
> -
> -       req_node = list_last_entry(&req_list.list, struct
> request_list, list);
> -       list_del(&req_node->list);
> -       current_index = req_node->current_index;
> -       sensor_index = req_node->sensor_idx;
> -       report_id = req_node->report_id;
> -       node_type = req_node->report_type;
> -
> -       if (node_type == HID_FEATURE_REPORT) {
> -               report_size = get_feature_report(sensor_index,
> report_id,
> -                                                cli_data-
> >feature_report[current_index]);
> -               if (report_size)
> -                       hid_input_report(cli_data-
> >hid_sensor_hubs[current_index],
> -                                        cli_data-
> >report_type[current_index],
> -                                        cli_data-
> >feature_report[current_index], report_size, 0);
> -               else
> -                       pr_err("AMDSFH: Invalid report size\n");
> -
> -       } else if (node_type == HID_INPUT_REPORT) {
> -               report_size = get_input_report(sensor_index,
> report_id,
> -                                              cli_data-
> >input_report[current_index],
> -                                              cli_data-
> >sensor_virt_addr[current_index]);
> -               if (report_size)
> -                       hid_input_report(cli_data-
> >hid_sensor_hubs[current_index],
> -                                        cli_data-
> >report_type[current_index],
> -                                        cli_data-
> >input_report[current_index], report_size, 0);
> -               else
> -                       pr_err("AMDSFH: Invalid report size\n");
> -       }
> -       cli_data->cur_hid_dev = current_index;
> -       cli_data->sensor_requested_cnt[current_index] = 0;
> -       amdtp_hid_wakeup(cli_data->hid_sensor_hubs[current_index]);
> -}
> -
> -static void amd_sfh_work_buffer(struct work_struct *work)
> -{
> -       struct amdtp_cl_data *cli_data = container_of(work, struct
> amdtp_cl_data, work_buffer.work);
> -       u8 report_size;
> -       int i;
> -
> -       for (i = 0; i < cli_data->num_hid_devices; i++) {
> -               report_size = get_input_report(cli_data-
> >sensor_idx[i], cli_data->report_id[i],
> -                                              cli_data-
> >input_report[i],
> -                                              cli_data-
> >sensor_virt_addr[i]);
> -               hid_input_report(cli_data->hid_sensor_hubs[i],
> HID_INPUT_REPORT,
> -                                cli_data->input_report[i],
> report_size, 0);
> -       }
> -       schedule_delayed_work(&cli_data->work_buffer,
> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
> -}
> -
> -int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
> -{
> -       struct amdtp_cl_data *cl_data = privdata->cl_data;
> -       struct amd_mp2_sensor_info info;
> -       struct device *dev;
> -       u32 feature_report_size;
> -       u32 input_report_size;
> -       u8 cl_idx;
> -       int rc, i;
> -
> -       dev = &privdata->pdev->dev;
> -       cl_data = kzalloc(sizeof(*cl_data), GFP_KERNEL);
> -       if (!cl_data)
> -               return -ENOMEM;
> -
> -       cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata,
> &cl_data->sensor_idx[0]);
> -
> -       INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
> -       INIT_DELAYED_WORK(&cl_data->work_buffer,
> amd_sfh_work_buffer);
> -       INIT_LIST_HEAD(&req_list.list);
> -
> -       for (i = 0; i < cl_data->num_hid_devices; i++) {
> -               cl_data->sensor_virt_addr[i] =
> dma_alloc_coherent(dev, sizeof(int) * 8,
> -                                                                
> &cl_data->sensor_dma_addr[i],
> -                                                                
> GFP_KERNEL);
> -               cl_data->sensor_sts[i] = 0;
> -               cl_data->sensor_requested_cnt[i] = 0;
> -               cl_data->cur_hid_dev = i;
> -               cl_idx = cl_data->sensor_idx[i];
> -               cl_data->report_descr_sz[i] = get_descr_sz(cl_idx,
> descr_size);
> -               if (!cl_data->report_descr_sz[i]) {
> -                       rc = -EINVAL;
> -                       goto cleanup;
> -               }
> -               feature_report_size = get_descr_sz(cl_idx,
> feature_size);
> -               if (!feature_report_size) {
> -                       rc = -EINVAL;
> -                       goto cleanup;
> -               }
> -               input_report_size =  get_descr_sz(cl_idx,
> input_size);
> -               if (!input_report_size) {
> -                       rc = -EINVAL;
> -                       goto cleanup;
> -               }
> -               cl_data->feature_report[i] =
> kzalloc(feature_report_size, GFP_KERNEL);
> -               if (!cl_data->feature_report[i]) {
> -                       rc = -ENOMEM;
> -                       goto cleanup;
> -               }
> -               cl_data->input_report[i] = kzalloc(input_report_size,
> GFP_KERNEL);
> -               if (!cl_data->input_report[i]) {
> -                       rc = -ENOMEM;
> -                       goto cleanup;
> -               }
> -               info.period = msecs_to_jiffies(AMD_SFH_IDLE_LOOP);
> -               info.sensor_idx = cl_idx;
> -               info.dma_address = cl_data->sensor_dma_addr[i];
> -
> -               cl_data->report_descr[i] = kzalloc(cl_data-
> >report_descr_sz[i], GFP_KERNEL);
> -               if (!cl_data->report_descr[i]) {
> -                       rc = -ENOMEM;
> -                       goto cleanup;
> -               }
> -               rc = get_report_descriptor(cl_idx, cl_data-
> >report_descr[i]);
> -               if (rc)
> -                       return rc;
> -               rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
> -               if (rc)
> -                       return rc;
> -               amd_start_sensor(privdata, info);
> -               cl_data->sensor_sts[i] = 1;
> -       }
> -       privdata->cl_data = cl_data;
> -       schedule_delayed_work(&cl_data->work_buffer,
> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
> -       return 0;
> -
> -cleanup:
> -       for (i = 0; i < cl_data->num_hid_devices; i++) {
> -               if (cl_data->sensor_virt_addr[i]) {
> -                       dma_free_coherent(&privdata->pdev->dev, 8 *
> sizeof(int),
> -                                         cl_data-
> >sensor_virt_addr[i],
> -                                         cl_data-
> >sensor_dma_addr[i]);
> -               }
> -               kfree(cl_data->feature_report[i]);
> -               kfree(cl_data->input_report[i]);
> -               kfree(cl_data->report_descr[i]);
> -       }
> -       kfree(cl_data);
> -       return rc;
> -}
> -
> -int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
> -{
> -       struct amdtp_cl_data *cl_data = privdata->cl_data;
> -       int i;
> -
> -       for (i = 0; i < cl_data->num_hid_devices; i++)
> -               amd_stop_sensor(privdata, i);
> -
> -       cancel_delayed_work_sync(&cl_data->work);
> -       cancel_delayed_work_sync(&cl_data->work_buffer);
> -       amdtp_hid_remove(cl_data);
> -
> -       for (i = 0; i < cl_data->num_hid_devices; i++) {
> -               if (cl_data->sensor_virt_addr[i]) {
> -                       dma_free_coherent(&privdata->pdev->dev, 8 *
> sizeof(int),
> -                                         cl_data-
> >sensor_virt_addr[i],
> -                                         cl_data-
> >sensor_dma_addr[i]);
> -               }
> -       }
> -       kfree(cl_data);
> -       return 0;
> -}


