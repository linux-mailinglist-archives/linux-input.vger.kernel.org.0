Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26F6E10D1
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 17:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjDMPRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 11:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjDMPRT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 11:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DEF1BC9
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681398991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eSbo6FcPsN7+n6wnqHB6hxbboajnWUeboN8D++bXm58=;
        b=Tk0yDcan4PLwxo2MXs0ih2rhCo5mNczxXK9Ivf6wUW7FOrDOzDLNKVjCrzfbgVYQQ1JXyA
        +hks8TiRE+HM8W60ZFIdR0QZAdCzMx+itbHb/LOANPW29fLFzdp5W/E04vnNeh+/DW85hJ
        tEMg5xa5s/mwB+NmqXtWZv0+yO2ygxs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-cLD-kX6fN82PggY2BBmx4g-1; Thu, 13 Apr 2023 11:16:26 -0400
X-MC-Unique: cLD-kX6fN82PggY2BBmx4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F9A1C00ABA;
        Thu, 13 Apr 2023 15:16:26 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 906EC4042AD0;
        Thu, 13 Apr 2023 15:16:24 +0000 (UTC)
Date:   Thu, 13 Apr 2023 17:16:21 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] HID: shield: Initial driver implementation with
 Thunderstrike support
Message-ID: <20230413151621.py34io57wcrfofo2@mail.corp.redhat.com>
References: <20230410170840.16119-1-rrameshbabu@nvidia.com>
 <20230410170840.16119-2-rrameshbabu@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410170840.16119-2-rrameshbabu@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Apr 10 2023, Rahul Rameshbabu wrote:
> Supports the Thunderstrike (SHIELD 2017) controller. Implements support for
> the Thunderstrike HOSTCMD firmware interface. Adds sysfs attributes about a
> SHIELD device and introduces haptics support for controllers.
> 
> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
> ---
>  MAINTAINERS              |   6 +
>  drivers/hid/Kconfig      |  18 ++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ids.h    |   3 +
>  drivers/hid/hid-shield.c | 587 +++++++++++++++++++++++++++++++++++++++

In addition to what Jiri said, would you mind changing the name to
hid-nvidia-shield.c or just hid-nvidia.c?
The "normal" naming scheme in the hid tree is to group devices by
vendors, and TBH, knowing that the "shield" is from Nvidia is not
necessarily obvious.

Cheers,
Benjamin

>  5 files changed, 615 insertions(+)
>  create mode 100644 drivers/hid/hid-shield.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b073facf399..4fa673401bc7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9122,6 +9122,12 @@ F:	drivers/hid/hid-sensor-*
>  F:	drivers/iio/*/hid-*
>  F:	include/linux/hid-sensor-*
>  
> +HID SHIELD DRIVER
> +M:	Rahul Rameshbabu <rrameshbabu@nvidia.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hid/hid-shield.c
> +
>  HID VRC-2 CAR CONTROLLER DRIVER
>  M:	Marcus Folkesson <marcus.folkesson@gmail.com>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 82f64fb31fda..eb19debaa1f5 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -990,6 +990,24 @@ config HID_SEMITEK
>  	- Woo-dy
>  	- X-Bows Nature/Knight
>  
> +config HID_SHIELD
> +	tristate "SHIELD HID Driver"
> +	depends on USB_HID
> +	depends on BT_HIDP
> +	help
> +	Support for NVIDIA SHIELD accessories.
> +
> +	Supported devices:
> +	- Thunderstrike (NVIDIA SHIELD Controller 2017)
> +
> +config SHIELD_FF
> +	bool "SHIELD force feedback support"
> +	depends on HID_SHIELD
> +	select INPUT_FF_MEMLESS
> +	help
> +	Say Y here if you would like to enable force feedback support for
> +	NVIDIA SHIELD accessories with haptics capabilities.
> +
>  config HID_SIGMAMICRO
>  	tristate "SiGma Micro-based keyboards"
>  	depends on USB_HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 5d37cacbde33..a2ed1db9ed9d 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -116,6 +116,7 @@ obj-$(CONFIG_HID_RMI)		+= hid-rmi.o
>  obj-$(CONFIG_HID_SAITEK)	+= hid-saitek.o
>  obj-$(CONFIG_HID_SAMSUNG)	+= hid-samsung.o
>  obj-$(CONFIG_HID_SEMITEK)	+= hid-semitek.o
> +obj-$(CONFIG_HID_SHIELD)	+= hid-shield.o
>  obj-$(CONFIG_HID_SIGMAMICRO)	+= hid-sigmamicro.o
>  obj-$(CONFIG_HID_SMARTJOYPLUS)	+= hid-sjoy.o
>  obj-$(CONFIG_HID_SONY)		+= hid-sony.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 63545cd307e5..4000d53b1bac 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -993,6 +993,9 @@
>  #define USB_DEVICE_ID_NTRIG_TOUCH_SCREEN_18   0x0014
>  #define USB_DEVICE_ID_NTRIG_DUOSENSE 0x1500
>  
> +#define USB_VENDOR_ID_NVIDIA				0x0955
> +#define USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER	0x7214
> +
>  #define USB_VENDOR_ID_ONTRAK		0x0a07
>  #define USB_DEVICE_ID_ONTRAK_ADU100	0x0064
>  
> diff --git a/drivers/hid/hid-shield.c b/drivers/hid/hid-shield.c
> new file mode 100644
> index 000000000000..3befa8f133c7
> --- /dev/null
> +++ b/drivers/hid/hid-shield.c
> @@ -0,0 +1,587 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
> + *
> + *  HID driver for NVIDIA SHIELD peripherals.
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/input-event-codes.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +
> +#include "hid-ids.h"
> +
> +#define NOT_INIT_STR "NOT INITIALIZED"
> +
> +enum {
> +	SHIELD_FW_VERSION_INITIALIZED = 0,
> +	SHIELD_BOARD_INFO_INITIALIZED,
> +};
> +
> +enum {
> +	THUNDERSTRIKE_FW_VERSION_UPDATE = 0,
> +	THUNDERSTRIKE_BOARD_INFO_UPDATE,
> +	THUNDERSTRIKE_HAPTICS_UPDATE,
> +};
> +
> +enum {
> +	THUNDERSTRIKE_HOSTCMD_REPORT_SIZE = 33,
> +	THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID = 0x4,
> +	THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID = 0x3,
> +};
> +
> +enum {
> +	THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION = 1,
> +	THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO = 16,
> +	THUNDERSTRIKE_HOSTCMD_ID_USB_INIT = 53,
> +	THUNDERSTRIKE_HOSTCMD_ID_HAPTICS = 57,
> +	THUNDERSTRIKE_HOSTCMD_ID_BLUETOOTH_INIT = 58,
> +};
> +
> +struct thunderstrike_hostcmd_board_info {
> +	__le16 revision;
> +	__le16 serial[7];
> +};
> +
> +struct thunderstrike_hostcmd_haptics {
> +	u8 motor_left;
> +	u8 motor_right;
> +};
> +
> +struct thunderstrike_hostcmd_resp_report {
> +	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID */
> +	u8 cmd_id;
> +	u8 reserved_at_10;
> +
> +	union {
> +		struct thunderstrike_hostcmd_board_info board_info;
> +		struct thunderstrike_hostcmd_haptics motors;
> +		__le16 fw_version;
> +		u8 payload[30];
> +	};
> +} __packed;
> +static_assert(sizeof(struct thunderstrike_hostcmd_resp_report) ==
> +	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
> +
> +struct thunderstrike_hostcmd_req_report {
> +	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID */
> +	u8 cmd_id;
> +	u8 reserved_at_10;
> +
> +	struct {
> +		u8 update;
> +		struct thunderstrike_hostcmd_haptics motors;
> +	} haptics;
> +	u8 reserved_at_30[27];
> +} __packed;
> +static_assert(sizeof(struct thunderstrike_hostcmd_req_report) ==
> +	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
> +
> +/* Common struct for shield accessories. */
> +struct shield_device {
> +	struct hid_device *hdev;
> +
> +	unsigned long initialized_flags;
> +	const char *codename;
> +	u16 fw_version;
> +	struct {
> +		u16 revision;
> +		char serial_number[15];
> +	} board_info;
> +};
> +
> +struct thunderstrike {
> +	struct shield_device base;
> +
> +	/* Sub-devices */
> +	struct input_dev *haptics_dev;
> +
> +	/* Resources */
> +	void *req_report_dmabuf;
> +	unsigned long update_flags;
> +	struct thunderstrike_hostcmd_haptics haptics_val;
> +	spinlock_t haptics_update_lock;
> +	struct work_struct hostcmd_req_work;
> +};
> +
> +static inline void thunderstrike_hostcmd_req_report_init(
> +	struct thunderstrike_hostcmd_req_report *report, u8 cmd_id)
> +{
> +	memset(report, 0, sizeof(*report));
> +	report->report_id = THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID;
> +	report->cmd_id = cmd_id;
> +}
> +
> +static inline void shield_strrev(char *dest, size_t len, u16 rev)
> +{
> +	dest[0] = ('A' - 1) + (rev >> 8);
> +	snprintf(&dest[1], len - 1, "%02X", 0xff & rev);
> +}
> +
> +static struct input_dev *shield_allocate_input_dev(struct hid_device *hdev,
> +						   const char *name_suffix)
> +{
> +	struct input_dev *idev;
> +
> +	idev = input_allocate_device();
> +	if (!idev)
> +		goto err_device;
> +
> +	idev->id.bustype = hdev->bus;
> +	idev->id.vendor = hdev->vendor;
> +	idev->id.product = hdev->product;
> +	idev->id.version = hdev->version;
> +	idev->uniq = hdev->uniq;
> +	idev->name = devm_kasprintf(&idev->dev, GFP_KERNEL, "%s %s", hdev->name,
> +				    name_suffix);
> +	if (!idev->name)
> +		goto err_name;
> +
> +	input_set_drvdata(idev, hdev);
> +
> +	return idev;
> +
> +err_name:
> +	input_free_device(idev);
> +err_device:
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +static struct input_dev *shield_haptics_create(
> +	struct shield_device *dev,
> +	int (*play_effect)(struct input_dev *, void *, struct ff_effect *))
> +{
> +	struct input_dev *haptics;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_SHIELD_FF))
> +		return NULL;
> +
> +	haptics = shield_allocate_input_dev(dev->hdev, "Haptics");
> +	if (IS_ERR(haptics))
> +		return haptics;
> +
> +	input_set_capability(haptics, EV_FF, FF_RUMBLE);
> +	input_ff_create_memless(haptics, NULL, play_effect);
> +
> +	ret = input_register_device(haptics);
> +	if (ret)
> +		goto err;
> +
> +	return haptics;
> +
> + err:
> +	input_free_device(haptics);
> +	return ERR_PTR(ret);
> +}
> +
> +static inline void thunderstrike_send_hostcmd_request(struct thunderstrike *ts)
> +{
> +	struct thunderstrike_hostcmd_req_report *report = ts->req_report_dmabuf;
> +	struct shield_device *shield_dev = &ts->base;
> +	int ret;
> +
> +	ret = hid_hw_raw_request(shield_dev->hdev, report->report_id,
> +				 ts->req_report_dmabuf,
> +				 THUNDERSTRIKE_HOSTCMD_REPORT_SIZE,
> +				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> +
> +	if (ret < 0) {
> +		hid_err(shield_dev->hdev,
> +			"Failed to output Thunderstrike HOSTCMD request HID report due to %pe\n",
> +			ERR_PTR(ret));
> +	}
> +}
> +
> +static void thunderstrike_hostcmd_req_work_handler(struct work_struct *work)
> +{
> +	struct thunderstrike *ts =
> +		container_of(work, struct thunderstrike, hostcmd_req_work);
> +	struct thunderstrike_hostcmd_req_report *report;
> +	unsigned long flags;
> +
> +	report = ts->req_report_dmabuf;
> +
> +	if (test_and_clear_bit(THUNDERSTRIKE_FW_VERSION_UPDATE, &ts->update_flags)) {
> +		thunderstrike_hostcmd_req_report_init(
> +			report, THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION);
> +		thunderstrike_send_hostcmd_request(ts);
> +	}
> +
> +	if (test_and_clear_bit(THUNDERSTRIKE_BOARD_INFO_UPDATE, &ts->update_flags)) {
> +		thunderstrike_hostcmd_req_report_init(
> +			report, THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO);
> +		thunderstrike_send_hostcmd_request(ts);
> +	}
> +
> +	if (test_and_clear_bit(THUNDERSTRIKE_HAPTICS_UPDATE, &ts->update_flags)) {
> +		thunderstrike_hostcmd_req_report_init(
> +			report, THUNDERSTRIKE_HOSTCMD_ID_HAPTICS);
> +
> +		report->haptics.update = 1;
> +		spin_lock_irqsave(&ts->haptics_update_lock, flags);
> +		report->haptics.motors = ts->haptics_val;
> +		spin_unlock_irqrestore(&ts->haptics_update_lock, flags);
> +
> +		thunderstrike_send_hostcmd_request(ts);
> +	}
> +}
> +
> +static inline void thunderstrike_request_firmware_version(struct thunderstrike *ts)
> +{
> +	set_bit(THUNDERSTRIKE_FW_VERSION_UPDATE, &ts->update_flags);
> +	schedule_work(&ts->hostcmd_req_work);
> +}
> +
> +static inline void thunderstrike_request_board_info(struct thunderstrike *ts)
> +{
> +	set_bit(THUNDERSTRIKE_BOARD_INFO_UPDATE, &ts->update_flags);
> +	schedule_work(&ts->hostcmd_req_work);
> +}
> +
> +static inline int
> +thunderstrike_update_haptics(struct thunderstrike *ts,
> +			     struct thunderstrike_hostcmd_haptics *motors)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ts->haptics_update_lock, flags);
> +	ts->haptics_val = *motors;
> +	spin_unlock_irqrestore(&ts->haptics_update_lock, flags);
> +
> +	set_bit(THUNDERSTRIKE_HAPTICS_UPDATE, &ts->update_flags);
> +	schedule_work(&ts->hostcmd_req_work);
> +
> +	return 0;
> +}
> +
> +static int thunderstrike_play_effect(struct input_dev *idev, void *data,
> +				     struct ff_effect *effect)
> +{
> +	struct hid_device *hdev = input_get_drvdata(idev);
> +	struct thunderstrike_hostcmd_haptics motors;
> +	struct shield_device *shield_dev;
> +	struct thunderstrike *ts;
> +
> +	if (effect->type != FF_RUMBLE)
> +		return 0;
> +
> +	shield_dev = hid_get_drvdata(hdev);
> +	ts = container_of(shield_dev, struct thunderstrike, base);
> +
> +	/* Thunderstrike motor values range from 0 to 32 inclusively */
> +	motors.motor_left = effect->u.rumble.strong_magnitude / 2047;
> +	motors.motor_right = effect->u.rumble.weak_magnitude / 2047;
> +
> +	hid_dbg(hdev, "Thunderstrike FF_RUMBLE request, left: %u right: %u\n",
> +		motors.motor_left, motors.motor_right);
> +
> +	return thunderstrike_update_haptics(ts, &motors);
> +}
> +
> +static void
> +thunderstrike_parse_fw_version_payload(struct shield_device *shield_dev,
> +				       __le16 fw_version)
> +{
> +	shield_dev->fw_version = le16_to_cpu(fw_version);
> +
> +	set_bit(SHIELD_FW_VERSION_INITIALIZED, &shield_dev->initialized_flags);
> +
> +	hid_dbg(shield_dev->hdev, "Thunderstrike firmware version 0x%04X\n",
> +		shield_dev->fw_version);
> +}
> +
> +static void
> +thunderstrike_parse_board_info_payload(struct shield_device *shield_dev,
> +				       struct thunderstrike_hostcmd_board_info *board_info)
> +{
> +	char board_revision_str[4];
> +	int i;
> +
> +	shield_dev->board_info.revision = le16_to_cpu(board_info->revision);
> +	for (i = 0; i < 7; ++i) {
> +		u16 val = le16_to_cpu(board_info->serial[i]);
> +
> +		shield_dev->board_info.serial_number[2 * i] = val & 0xFF;
> +		shield_dev->board_info.serial_number[2 * i + 1] = val >> 8;
> +	}
> +	shield_dev->board_info.serial_number[14] = '\0';
> +
> +	set_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags);
> +
> +	shield_strrev(board_revision_str, 4, shield_dev->board_info.revision);
> +	hid_dbg(shield_dev->hdev,
> +		"Thunderstrike BOARD_REVISION_%s (0x%04X) S/N: %s\n",
> +		board_revision_str, shield_dev->board_info.revision,
> +		shield_dev->board_info.serial_number);
> +}
> +
> +static inline void
> +thunderstrike_parse_haptics_payload(struct shield_device *shield_dev,
> +				    struct thunderstrike_hostcmd_haptics *haptics)
> +{
> +	hid_dbg(shield_dev->hdev,
> +		"Thunderstrike haptics HOSTCMD response, left: %u right: %u\n",
> +		haptics->motor_left, haptics->motor_right);
> +}
> +
> +static int thunderstrike_parse_report(struct shield_device *shield_dev,
> +				      struct hid_report *report, u8 *data,
> +				      int size)
> +{
> +	struct thunderstrike_hostcmd_resp_report *hostcmd_resp_report;
> +	struct thunderstrike *ts =
> +		container_of(shield_dev, struct thunderstrike, base);
> +	struct hid_device *hdev = shield_dev->hdev;
> +
> +	switch (report->id) {
> +	case THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID:
> +		if (size != THUNDERSTRIKE_HOSTCMD_REPORT_SIZE) {
> +			hid_err(hdev,
> +				"Encountered Thunderstrike HOSTCMD HID report with unexpected size %d\n",
> +				size);
> +			return -EINVAL;
> +		}
> +
> +		hostcmd_resp_report =
> +			(struct thunderstrike_hostcmd_resp_report *)data;
> +
> +		switch (hostcmd_resp_report->cmd_id) {
> +		case THUNDERSTRIKE_HOSTCMD_ID_FW_VERSION:
> +			thunderstrike_parse_fw_version_payload(
> +				shield_dev, hostcmd_resp_report->fw_version);
> +			break;
> +		case THUNDERSTRIKE_HOSTCMD_ID_BOARD_INFO:
> +			thunderstrike_parse_board_info_payload(
> +				shield_dev, &hostcmd_resp_report->board_info);
> +			break;
> +		case THUNDERSTRIKE_HOSTCMD_ID_HAPTICS:
> +			thunderstrike_parse_haptics_payload(
> +				shield_dev, &hostcmd_resp_report->motors);
> +			break;
> +
> +		case THUNDERSTRIKE_HOSTCMD_ID_USB_INIT:
> +		case THUNDERSTRIKE_HOSTCMD_ID_BLUETOOTH_INIT:
> +			/* May block HOSTCMD requests till received initially */
> +			thunderstrike_request_firmware_version(ts);
> +			thunderstrike_request_board_info(ts);
> +			/* Only HOSTCMD that can be triggered without a request */
> +			return 0;
> +		default:
> +			hid_warn(hdev,
> +				 "Unhandled Thunderstrike HOSTCMD id %d\n",
> +				 hostcmd_resp_report->cmd_id);
> +			return -ENOENT;
> +		}
> +
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct shield_device *thunderstrike_create(struct hid_device *hdev)
> +{
> +	struct shield_device *shield_dev;
> +	struct thunderstrike *ts;
> +
> +	ts = devm_kzalloc(&hdev->dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ts->req_report_dmabuf = devm_kzalloc(
> +		&hdev->dev, THUNDERSTRIKE_HOSTCMD_REPORT_SIZE, GFP_KERNEL);
> +	if (!ts->req_report_dmabuf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shield_dev = &ts->base;
> +	shield_dev->hdev = hdev;
> +	shield_dev->codename = "Thunderstrike";
> +
> +	spin_lock_init(&ts->haptics_update_lock);
> +	INIT_WORK(&ts->hostcmd_req_work, thunderstrike_hostcmd_req_work_handler);
> +
> +	hid_set_drvdata(hdev, shield_dev);
> +
> +	ts->haptics_dev = shield_haptics_create(shield_dev, thunderstrike_play_effect);
> +	if (IS_ERR(ts->haptics_dev))
> +		return ERR_CAST(ts->haptics_dev);
> +
> +	hid_info(hdev, "Registered Thunderstrike controller\n");
> +	return shield_dev;
> +}
> +
> +static ssize_t firmware_version_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct hid_device *hdev = to_hid_device(dev);
> +	struct shield_device *shield_dev;
> +	int ret;
> +
> +	shield_dev = hid_get_drvdata(hdev);
> +
> +	if (test_bit(SHIELD_FW_VERSION_INITIALIZED, &shield_dev->initialized_flags))
> +		ret = sysfs_emit(buf, "0x%04X\n", shield_dev->fw_version);
> +	else
> +		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RO(firmware_version);
> +
> +static ssize_t hardware_version_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct hid_device *hdev = to_hid_device(dev);
> +	struct shield_device *shield_dev;
> +	char board_revision_str[4];
> +	int ret;
> +
> +	shield_dev = hid_get_drvdata(hdev);
> +
> +	if (test_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags)) {
> +		shield_strrev(board_revision_str, 4, shield_dev->board_info.revision);
> +		ret = sysfs_emit(buf, "%s BOARD_REVISION_%s (0x%04X)\n",
> +				 shield_dev->codename, board_revision_str,
> +				 shield_dev->board_info.revision);
> +	} else
> +		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RO(hardware_version);
> +
> +static ssize_t serial_number_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct hid_device *hdev = to_hid_device(dev);
> +	struct shield_device *shield_dev;
> +	int ret;
> +
> +	shield_dev = hid_get_drvdata(hdev);
> +
> +	if (test_bit(SHIELD_BOARD_INFO_INITIALIZED, &shield_dev->initialized_flags))
> +		ret = sysfs_emit(buf, "%s\n", shield_dev->board_info.serial_number);
> +	else
> +		ret = sysfs_emit(buf, NOT_INIT_STR "\n");
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RO(serial_number);
> +
> +static struct attribute *shield_device_attrs[] = {
> +	&dev_attr_firmware_version.attr,
> +	&dev_attr_hardware_version.attr,
> +	&dev_attr_serial_number.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(shield_device);
> +
> +static int shield_raw_event(struct hid_device *hdev, struct hid_report *report,
> +			    u8 *data, int size)
> +{
> +	struct shield_device *dev = hid_get_drvdata(hdev);
> +
> +	return thunderstrike_parse_report(dev, report, data, size);
> +}
> +
> +static int shield_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct shield_device *shield_dev = NULL;
> +	struct thunderstrike *ts;
> +	int ret;
> +
> +	ret = hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "Parse failed\n");
> +		return ret;
> +	}
> +
> +	switch (id->product) {
> +	case USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER:
> +		shield_dev = thunderstrike_create(hdev);
> +		break;
> +	}
> +
> +	if (unlikely(!shield_dev)) {
> +		hid_err(hdev, "Failed to identify SHIELD device\n");
> +		return -ENODEV;
> +	}
> +	if (IS_ERR(shield_dev)) {
> +		hid_err(hdev, "Failed to create SHIELD device\n");
> +		return PTR_ERR(shield_dev);
> +	}
> +
> +	ts = container_of(shield_dev, struct thunderstrike, base);
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
> +	if (ret) {
> +		hid_err(hdev, "Failed to start HID device\n");
> +		goto err_haptics;
> +	}
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "Failed to open HID device\n");
> +		goto err_stop;
> +	}
> +
> +	thunderstrike_request_firmware_version(ts);
> +	thunderstrike_request_board_info(ts);
> +
> +	return ret;
> +
> +err_stop:
> +	hid_hw_stop(hdev);
> +err_haptics:
> +	if (ts->haptics_dev)
> +		input_unregister_device(ts->haptics_dev);
> +	return ret;
> +}
> +
> +static void shield_remove(struct hid_device *hdev)
> +{
> +	struct shield_device *dev = hid_get_drvdata(hdev);
> +	struct thunderstrike *ts;
> +
> +	ts = container_of(dev, struct thunderstrike, base);
> +
> +	hid_hw_close(hdev);
> +	if (ts->haptics_dev)
> +		input_unregister_device(ts->haptics_dev);
> +	cancel_work_sync(&ts->hostcmd_req_work);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id shield_devices[] = {
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NVIDIA,
> +			       USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_NVIDIA,
> +			 USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER) },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(hid, shield_devices);
> +
> +static struct hid_driver shield_driver = {
> +	.name         = "shield",
> +	.id_table     = shield_devices,
> +	.probe        = shield_probe,
> +	.remove       = shield_remove,
> +	.raw_event    = shield_raw_event,
> +	.driver = {
> +		.dev_groups = shield_device_groups,
> +	},
> +};
> +module_hid_driver(shield_driver);
> +
> +MODULE_AUTHOR("Rahul Rameshbabu <rrameshbabu@nvidia.com>");
> +MODULE_DESCRIPTION("HID Driver for NVIDIA SHIELD peripherals.");
> +MODULE_LICENSE("GPL");
> -- 
> 2.38.4
> 

