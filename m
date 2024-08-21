Return-Path: <linux-input+bounces-5724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25A959660
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 10:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F35CC1C21466
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E51B199FD3;
	Wed, 21 Aug 2024 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NZ6L/LZL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11F188A3A;
	Wed, 21 Aug 2024 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724226733; cv=none; b=tv2NzEpq93btl4VaqSbGQfmze2Oz6Fka2cKMAI15Kh2ymaT94CYz3YnI5Y6sgrDzvj3HB5sEfFZqE6bQ0Wm2uEv+nodaQxruMFd6ELmcokHwf3502R4xPbK+Z01giU9ncMShwYb4vIOlNGieEttQ7X739x5YwC93E72BHcCvGzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724226733; c=relaxed/simple;
	bh=7u1M3tDkDnIb7SSz581J9XtBZ3VXqvJgBieYQzZ7HjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeLgnWiOeohxy+lUVdsyOS4cakbfs8CtucyFtbXqZ5eDu3N/YegLV56KzQzdt6IoZc3bs9168mbj62vMDveeTxiwI/V+dQ0PT93Qppp1j4Tl7fJThD0EvV1kDUwuRP7fRxIw/y6Br7qO5zQ7hLfQPWlDx+2nPzycJ883gycMuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=NZ6L/LZL; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gg7IslemGTL2Bgg7Isb31X; Wed, 21 Aug 2024 09:50:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724226653;
	bh=3HRIMsRe9ZF1vHCOzKNIllcOM1dna81GBNRzmVCw7iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NZ6L/LZL2bh176HKaW2JaPWmRs9CURZ3A/PrdSBbLMDgYLHDLaP+NemRjrxwu0vBm
	 m/RvBX6oLMyILrcUbAJM/CxpqGk6udGcPkBznF47OVwzeirBkVHCTbImdUH28RTATJ
	 iqB5F5oSCupI9/qAPHMes2qYOiE2LZRxsZ/7oU3KtvdVS/dxXQEM5ybiw0XbAstyfI
	 zOVd6WAl20GQ5e2wStzP/eg0ZJ4Us3lycX+88lib6OMydx44ouI1O3lYhZM2SFW24T
	 eM44jtGljWYdcmR7w+JclQ2PejZ4i6acviGoBIOCccf3WsO5Q30va69hlDRcrgAr3O
	 ixIb6BwRYLCJg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 09:50:53 +0200
X-ME-IP: 90.11.132.44
Message-ID: <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
Date: Wed, 21 Aug 2024 09:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family
 driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/08/2024 à 02:22, Stuart Hayhurst a écrit :
> Introduce a driver for the Corsair Void family of headsets, supporting:
>   - Battery reporting (power_supply)
>   - Sidetone setting support
>   - Physical microphone location reporting
>   - Headset and receiver firmware version reporting
>   - Built-in alert triggering
>   - USB wireless_status
> 
> Tested with a Void Pro Wireless, Void Elite Wireless and a Void Elite Wired
> 
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> ---

Hi,

...

> +struct corsair_void_drvdata {
> +	struct hid_device *hid_dev;
> +	struct device *dev;
> +
> +	char *name;
> +	bool is_wired;

Maybe is_wired could be close to other bools below, to improve avoid 
holes in the structure?

> +	unsigned int sidetone_max;
> +
> +	struct corsair_void_battery_data battery_data;
> +	bool mic_up;
> +	bool connected;
> +	int fw_receiver_major;
> +	int fw_receiver_minor;
> +	int fw_headset_major;
> +	int fw_headset_minor;
> +
> +	struct power_supply *battery;
> +	struct power_supply_desc battery_desc;
> +	struct mutex battery_mutex;
> +
> +	struct delayed_work delayed_status_work;
> +	struct delayed_work delayed_firmware_work;
> +	struct work_struct battery_remove_work;
> +	struct work_struct battery_add_work;
> +};

...

> +static ssize_t sidetone_max_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);

Missing newline.

> +	return sysfs_emit(buf, "%d\n", drvdata->sidetone_max);
> +}

...

> +static ssize_t send_alert_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct hid_device *hid_dev = drvdata->hid_dev;
> +	unsigned char alert_id;
> +	unsigned char *send_buf __free(kfree) = NULL;
> +	int ret;
> +
> +	if (!drvdata->connected || drvdata->is_wired)
> +		return -ENODEV;
> +
> +	/* Only accept 0 or 1 for alert ID */
> +	if (kstrtou8(buf, 10, &alert_id) || alert_id >= 2)
> +		return -EINVAL;
> +
> +	send_buf = kmalloc(3, GFP_KERNEL);
> +	if (!send_buf)
> +		return -ENOMEM;
> +
> +	/* Packet format to send alert with ID alert_id */
> +	send_buf[0] = CORSAIR_VOID_NOTIF_REQUEST_ID;
> +	send_buf[1] = 0x02;
> +	send_buf[2] = alert_id;
> +
> +	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_NOTIF_REQUEST_ID,
> +				 send_buf, 3, HID_OUTPUT_REPORT,
> +				 HID_REQ_SET_REPORT);
> +	if (ret < 0) {
> +		hid_warn(hid_dev, "failed to send alert request (reason: %d)",
> +			 ret);
> +	} else {
> +		ret = count;
> +	}
> +

I'm not familiar with the hid_hw_raw_request() API, but I think that a 
kfree(send_buf) is missing here.

> +	return ret;
> +}

...

> +static int corsair_void_set_sidetone_wireless(struct device *dev, const char *buf,
> +					      unsigned char sidetone)
> +{
> +	struct corsair_void_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct hid_device *hid_dev = drvdata->hid_dev;
> +	unsigned char *send_buf __free(kfree) = NULL;
> +	int ret = 0;

Nitpick: No need to init.

> +
> +	send_buf = kmalloc(12, GFP_KERNEL);
> +	if (!send_buf)
> +		return -ENOMEM;
> +
> +	/* Packet format to set sidetone for wireless headsets */
> +	send_buf[0] = CORSAIR_VOID_SIDETONE_REQUEST_ID;
> +	send_buf[1] = 0x0B;
> +	send_buf[2] = 0x00;
> +	send_buf[3] = 0xFF;
> +	send_buf[4] = 0x04;
> +	send_buf[5] = 0x0E;
> +	send_buf[6] = 0xFF;
> +	send_buf[7] = 0x05;
> +	send_buf[8] = 0x01;
> +	send_buf[9] = 0x04;
> +	send_buf[10] = 0x00;
> +	send_buf[11] = sidetone + 200;
> +
> +	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_SIDETONE_REQUEST_ID,
> +				 send_buf, 12, HID_FEATURE_REPORT,
> +				 HID_REQ_SET_REPORT);

Missing kfree(send_buf)?

> +
> +	return ret;
> +}

...

> +static int corsair_void_request_status(struct hid_device *hid_dev, int id)
> +{
> +	unsigned char *send_buf __free(kfree) = NULL;
> +	int ret;
> +
> +	send_buf = kmalloc(2, GFP_KERNEL);
> +	if (!send_buf)
> +		return -ENOMEM;
> +
> +	/* Packet format to request data item (status / firmware) refresh */
> +	send_buf[0] = CORSAIR_VOID_STATUS_REQUEST_ID;
> +	send_buf[1] = id;
> +
> +	/* Send request for data refresh */
> +	ret = hid_hw_raw_request(hid_dev, CORSAIR_VOID_STATUS_REQUEST_ID,
> +			  send_buf, 2, HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> +	if (ret < 0) {
> +		switch (id) {
> +		case CORSAIR_VOID_STATUS_REPORT_ID:
> +			hid_warn(hid_dev, "failed to request battery (reason: %d)",
> +				 ret);
> +			break;
> +		case CORSAIR_VOID_FIRMWARE_REPORT_ID:
> +			hid_warn(hid_dev, "failed to request firmware (reason: %d)",
> +				 ret);
> +			break;
> +		default:
> +			hid_warn(hid_dev, "failed to send report %d (reason: %d)",
> +				 id, ret);
> +			break;
> +		}
> +	} else {
> +		ret = 0;

You could save 2 lines if ret was initialized when declared.

> +	}
> +

Missing kfree(send_buf)?

> +	return ret;
> +}

...

> +static int corsair_void_probe(struct hid_device *hid_dev,
> +			      const struct hid_device_id *hid_id)
> +{
> +	int ret;
> +	struct corsair_void_drvdata *drvdata;
> +	char *name;
> +	int name_length;
> +
> +	if (!hid_is_usb(hid_dev))
> +		return -EINVAL;
> +
> +	drvdata = devm_kzalloc(&hid_dev->dev, sizeof(*drvdata),
> +			       GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	hid_set_drvdata(hid_dev, drvdata);
> +	dev_set_drvdata(&hid_dev->dev, drvdata);
> +
> +	drvdata->dev = &hid_dev->dev;
> +	drvdata->hid_dev = hid_dev;
> +	drvdata->is_wired = hid_id->driver_data == CORSAIR_VOID_WIRED;
> +
> +	drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRELESS;
> +	if (drvdata->is_wired)
> +		drvdata->sidetone_max = CORSAIR_VOID_SIDETONE_MAX_WIRED;
> +
> +	/* Set initial values for no wireless headset attached */
> +	/* If a headset is attached, it'll be prompted later */
> +	corsair_void_set_unknown_wireless_data(drvdata);
> +	corsair_void_set_unknown_batt(drvdata);
> +
> +	/* Receiver version won't be reset after init */
> +	/* Headset version already set via set_unknown_wireless_data */
> +	drvdata->fw_receiver_major = 0;
> +	drvdata->fw_receiver_minor = 0;
> +
> +	ret = hid_parse(hid_dev);
> +	if (ret) {
> +		hid_err(hid_dev, "parse failed (reason: %d)\n", ret);
> +		return ret;
> +	}
> +
> +	name_length = snprintf(NULL, 0, "corsair-void-%d-battery", hid_dev->id);
> +	name = devm_kzalloc(drvdata->dev, name_length + 1, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +	snprintf(name, name_length + 1, "corsair-void-%d-battery", hid_dev->id);

devm_kasprintf() would simplify this.

> +
> +	drvdata->battery_desc.name = name;
> +	drvdata->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
> +	drvdata->battery_desc.properties = corsair_void_battery_props;
> +	drvdata->battery_desc.num_properties = ARRAY_SIZE(corsair_void_battery_props);
> +	drvdata->battery_desc.get_property = corsair_void_battery_get_property;
> +
> +	drvdata->battery = NULL;
> +	INIT_WORK(&drvdata->battery_remove_work,
> +		  corsair_void_battery_remove_work_handler);
> +	INIT_WORK(&drvdata->battery_add_work,
> +		  corsair_void_battery_add_work_handler);
> +	ret = devm_mutex_init(drvdata->dev, &drvdata->battery_mutex);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
> +	if (ret)
> +		return ret;
> +
> +	/* Any failures after here will need to call hid_hw_stop */
> +	ret = hid_hw_start(hid_dev, HID_CONNECT_DEFAULT);
> +	if (ret) {
> +		hid_err(hid_dev, "hid_hw_start failed (reason: %d)\n", ret);
> +		goto failed_after_sysfs;
> +	}
> +
> +	/* Refresh battery data, in case wireless headset is already connected */
> +	INIT_DELAYED_WORK(&drvdata->delayed_status_work,
> +			  corsair_void_status_work_handler);
> +	schedule_delayed_work(&drvdata->delayed_status_work,
> +			      msecs_to_jiffies(100));
> +
> +	/* Refresh firmware versions */
> +	INIT_DELAYED_WORK(&drvdata->delayed_firmware_work,
> +			  corsair_void_firmware_work_handler);
> +	schedule_delayed_work(&drvdata->delayed_firmware_work,
> +			      msecs_to_jiffies(100));
> +
> +	return 0;
> +
> +failed_after_sysfs:
> +	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
> +	return ret;
> +}

...

CJ



