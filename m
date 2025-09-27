Return-Path: <linux-input+bounces-15132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A021EBA5841
	for <lists+linux-input@lfdr.de>; Sat, 27 Sep 2025 04:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F5532797F
	for <lists+linux-input@lfdr.de>; Sat, 27 Sep 2025 02:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC541B21BD;
	Sat, 27 Sep 2025 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3AjyURA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84B1AAE13
	for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 02:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758940977; cv=none; b=kTzFWUT2fhsOfvi1jTd8lqq4anXU6UWnOJ24HBqNk638Q7jf1CkQ+QWUWsIeDyIGy9kQkTekQOwq+LVC+tqawlezw1z7tf6aRi//Itx+r+cgnZ4tscVTdTvCeuHp4wKabbtfcZY7bYYxoZhSPYo04Np8h3UOCCTWs1ONocQEUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758940977; c=relaxed/simple;
	bh=V0IFeYkrRpMQxLmSPYJJ3m/Pej3OJk83kjUkQcd9JxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk0yLHRV9GSMoNfOk9ilDoydDBh8+T3LoSclRkzSU6JLbQQe6nc/RNNQhaNAiTEpAnga/XqUT9WMCAh3OtYknTuHz+zaFzUq22pz8nbk2F2BwXuRj86VjzbUBgktDfB/iZZ/e314iS/pdyX2J1sUW6zu1flcNYQDB3D/2LngGX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3AjyURA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2570bf605b1so30654005ad.2
        for <linux-input@vger.kernel.org>; Fri, 26 Sep 2025 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758940975; x=1759545775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZ5dEzmLV7YHIr68piHfhukDE0D06LIStlJlC4x+IlQ=;
        b=i3AjyURAvdoCo8HukOovb090upnrZbx3m0jKbs6um5SCa/XjkiNpz2Wohuvqfjoc9R
         EONJOyTTXftZ1lsyf3q/sUHHdzef6DxKAuv7HpUmklfWR0sNtu4OKgarmlXwdffTdDxk
         DEi0IPwsy+nX1y5UkrUehdRKIOmUrtYf7uCRnayf7dkIMRAyihUz2onUE8cV9+vhu0BJ
         X6blULeW9a8x4gYpo8mUCI3SlEv8zePWgRaUbxjkwCc+1YXDeG6JT8i+ZnTcFROowfFU
         XRyQRSqpIyETNterNT2gUd+QXHlYqJlcaBvQUFk0uFZDd1QbrhK50Z0/v34jAm7fbwzq
         6BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758940975; x=1759545775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ5dEzmLV7YHIr68piHfhukDE0D06LIStlJlC4x+IlQ=;
        b=mS223mTMg/M2edJ8oAhYKoyiixB28TLXNvzFtZ3uYQVwt9d6gwpYq99X0agmkplj2e
         ceIIM7VJIbN3/BVar/hQQWyuQ/TIG3H6R2c2k+1U4Vv8CIGa3B+GDqMbxSTsJVCad7+c
         R41Ny8SPqj91ume2+FSwBlR8HxgE6CUSkwE3GdTmDaZ3WX0KJ1suG9VuHZ143tuvpu2O
         sEi7I7umXbX/jh9pU5VCopYiSI3R97jTbLSLJI6WZUw0+u6G1JTyasdjQ9pbs8ZOuWVz
         4iBQDBoQcRkOjVLGRAG5J4eGN/Y3ZtUwr6HLaQYJ1FBdhE5kHpb7Lk3xKy0zecdiYaNY
         9x+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcGT3LK/aTAPLRjhHkjWyXlSahQLUf7vn6KyofCPBZ1viy0eTDzH1ATubcBh5jF13niHKeBztZWOBC1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwApnQZZOXVyO/9vEVkD/RMRnr2MkTgyOZWvmPE9ts6UC+fvu7x
	M9VQH6dyZJTQE0lhZR8ZPMpwGkQ5/rv1rDuMOase9reXx05GX/Vp0etr
X-Gm-Gg: ASbGncsnLhzh4ugzjgZVF199YdFtxITWCPVvK7RhjtyYjlFNiYlWTH9DKbFmdQLDSC8
	07i8YcuEhWa8env+CISnDT8awr+61AhqhrYv8U8U1XtA+ZErYSwIkPlnnZrt3Y4L+BqYm1M5mAM
	y4bxUUDSupHNzRMq7sNjKAFq9v4/RcB4/yAD4LABvMPcl3LmfTegbVgvkqH0BwijBoyn0XoEPhl
	KuCBxpLiU03Z9Tf/4i1Jkzpk8XJYyO8Wmv79E+dwTTdqJZaolP5U/Zn6PpjapG57C6OodDBjgq1
	pubfb7WlKRdWN5AqOgRyFeNy/IlHrjfpcwZyKaNyrYjpDpgyfGjbGTruxSuFE/eXLHRLnbwisRr
	f1tSmr7zDstkPCp4j5qe7bFDVjKBguHV1QhpMBE8=
X-Google-Smtp-Source: AGHT+IFfX7fMjKOcGm+vnKZdVe4tiHz7C9WUzcfjpA9w/e3H2Ogk68g6dOjY8/DPsPfwdrCVEee0hw==
X-Received: by 2002:a17:903:19ef:b0:25d:885:5b6b with SMTP id d9443c01a7336-27ed4a76e9emr111183875ad.58.1758940974483;
        Fri, 26 Sep 2025 19:42:54 -0700 (PDT)
Received: from [192.168.68.106] ([177.172.30.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed689ffa1sm67006265ad.99.2025.09.26.19.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 19:42:54 -0700 (PDT)
Message-ID: <43a2ba01-41f6-4d56-bf7b-6212d56b72a6@gmail.com>
Date: Sat, 27 Sep 2025 02:42:35 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Input: add support for the STM FTS2BA61Y
 touchscreen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250920014450.37787-1-ghatto404@gmail.com>
 <20250920014450.37787-3-ghatto404@gmail.com>
 <cxnqffq3vj22nk4nukhqb2m3gqeomajdusrhaaq77v2rkfxnup@g4mahnify2ke>
Content-Language: en-US
From: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>
In-Reply-To: <cxnqffq3vj22nk4nukhqb2m3gqeomajdusrhaaq77v2rkfxnup@g4mahnify2ke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/20/25 21:13, Dmitry Torokhov wrote:
> Hi Eric,
>
> On Sat, Sep 20, 2025 at 01:44:50AM +0000, Eric Gonçalves wrote:
>> The ST-Microelectronics FTS2BA61Y touchscreen is a capacitive multi-touch
>> controller connected through SPI at 0x0, the touchscreen is typically
>> used in mobile devices (like the Galaxy S22 series)
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> Thank you for the patch. A few comments below.
>
>> ---
>>   drivers/input/touchscreen/Kconfig     |  11 +
>>   drivers/input/touchscreen/Makefile    |   1 +
>>   drivers/input/touchscreen/fts2ba61y.c | 588 ++++++++++++++++++++++++++
>>   3 files changed, 600 insertions(+)
>>   create mode 100644 drivers/input/touchscreen/fts2ba61y.c
>>
>> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
>> index 196905162945..1e199191f527 100644
>> --- a/drivers/input/touchscreen/Kconfig
>> +++ b/drivers/input/touchscreen/Kconfig
>> @@ -370,6 +370,17 @@ config TOUCHSCREEN_EXC3000
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called exc3000.
>>   
>> +config TOUCHSCREEN_FTS2BA61Y
>> +	tristate "ST-Microelectronics FTS2BA61Y touchscreen"
>> +	depends on SPI
>> +	help
>> +	  Say Y here if you have the ST-Microelectronics FTS2BA61Y touchscreen
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called fts2ba61y.
>> +
>>   config TOUCHSCREEN_FUJITSU
>>   	tristate "Fujitsu serial touchscreen"
>>   	select SERIO
>> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
>> index 97a025c6a377..408a9fd5bd35 100644
>> --- a/drivers/input/touchscreen/Makefile
>> +++ b/drivers/input/touchscreen/Makefile
>> @@ -43,6 +43,7 @@ obj-$(CONFIG_TOUCHSCREEN_ELO)		+= elo.o
>>   obj-$(CONFIG_TOUCHSCREEN_EGALAX)	+= egalax_ts.o
>>   obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
>>   obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
>> +obj-$(CONFIG_TOUCHSCREEN_FTS2BA61Y)	+= fts2ba61y.o
>>   obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
>>   obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
>>   obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
>> diff --git a/drivers/input/touchscreen/fts2ba61y.c b/drivers/input/touchscreen/fts2ba61y.c
>> new file mode 100644
>> index 000000000000..b3b3abca5404
>> --- /dev/null
>> +++ b/drivers/input/touchscreen/fts2ba61y.c
>> @@ -0,0 +1,588 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Based loosely on s6sy761.c
>> +
>> +#include <linux/delay.h>
>> +#include <linux/input.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/input/mt.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/input/touchscreen.h>
>> +#include <linux/unaligned.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +/* commands */
>> +#define FTS2BA61Y_CMD_SENSE_ON			0x10
>> +#define FTS2BA61Y_CMD_SENSE_OFF			0x11
>> +#define FTS2BA61Y_CMD_READ_PANEL_INFO		0x23
>> +#define FTS2BA61Y_CMD_READ_FW_VER		0x24
>> +#define FTS2BA61Y_CMD_TOUCHTYPE			0x30 /* R/W for get/set */
>> +#define FTS2BA61Y_CMD_CLEAR_EVENTS		0x62
>> +#define FTS2BA61Y_CMD_READ_EVENT		0x87
>> +#define FTS2BA61Y_CMD_CUSTOM_W			0xC0
>> +#define FTS2BA61Y_CMD_CUSTOM_R			0xD1
>> +#define FTS2BA61Y_CMD_REG_W			0xFA
>> +#define FTS2BA61Y_CMD_REG_R			0xFB
>> +
>> +/* touch type masks */
>> +#define FTS2BA61Y_MASK_TOUCH			BIT(0)
>> +#define FTS2BA61Y_MASK_HOVER			BIT(1)
>> +#define FTS2BA61Y_MASK_COVER			BIT(2)
>> +#define FTS2BA61Y_MASK_GLOVE			BIT(3)
>> +#define FTS2BA61Y_MASK_STYLUS			BIT(4)
>> +#define FTS2BA61Y_MASK_PALM			BIT(5)
>> +#define FTS2BA61Y_MASK_WET			BIT(6)
>> +#define FTS2BA61Y_TOUCHTYPE_DEFAULT		(FTS2BA61Y_MASK_TOUCH | \
>> +						 FTS2BA61Y_MASK_PALM | \
>> +						 FTS2BA61Y_MASK_WET)
>> +
>> +/* event status masks */
>> +#define FTS2BA61Y_MASK_STYPE			GENMASK(5, 2)
>> +#define FTS2BA61Y_MASK_EVENT_ID			GENMASK(1, 0)
>> +
>> +/* event coordinate masks */
>> +#define FTS2BA61Y_MASK_TCHSTA			GENMASK(7, 6)
>> +#define FTS2BA61Y_MASK_TID			GENMASK(5, 2)
>> +#define FTS2BA61Y_MASK_X_3_0			GENMASK(7, 4)
>> +#define FTS2BA61Y_MASK_Y_3_0			GENMASK(3, 0)
>> +#define FTS2BA61Y_MASK_Z			GENMASK(5, 0)
>> +#define FTS2BA61Y_MASK_TTYPE_3_2		GENMASK(7, 6)
>> +#define FTS2BA61Y_MASK_TTYPE_1_0		GENMASK(1, 0)
>> +#define FTS2BA61Y_MASK_LEFT_EVENTS		GENMASK(4, 0)
>> +
>> +/* event error status */
>> +#define FTS2BA61Y_EVENT_STATUSTYPE_INFO		0x2
>> +
>> +/* information report */
>> +#define FTS2BA61Y_INFO_READY_STATUS		0x0
>> +
>> +/* event status */
>> +#define FTS2BA61Y_COORDINATE_EVENT		0x0
>> +
>> +/* touch types */
>> +#define FTS2BA61Y_TOUCHTYPE_NORMAL		0x0
>> +#define FTS2BA61Y_TOUCHTYPE_HOVER		0x1
>> +#define FTS2BA61Y_TOUCHTYPE_FLIPCOVER		0x2
>> +#define FTS2BA61Y_TOUCHTYPE_GLOVE		0x3
>> +#define FTS2BA61Y_TOUCHTYPE_STYLUS		0x4
>> +#define FTS2BA61Y_TOUCHTYPE_PALM		0x5
>> +#define FTS2BA61Y_TOUCHTYPE_WET			0x6
>> +#define FTS2BA61Y_TOUCHTYPE_PROXIMITY		0x7
>> +#define FTS2BA61Y_TOUCHTYPE_JIG			0x8
>> +
>> +#define FTS2BA61Y_COORDINATE_ACTION_NONE	0x0
>> +#define FTS2BA61Y_COORDINATE_ACTION_PRESS	0x1
>> +#define FTS2BA61Y_COORDINATE_ACTION_MOVE	0x2
>> +#define FTS2BA61Y_COORDINATE_ACTION_RELEASE	0x3
>> +
>> +#define FTS2BA61Y_DEV_NAME			"fts2ba61y"
>> +#define FTS2BA61Y_EVENT_BUFF_SIZE		16
>> +#define FTS2BA61Y_PANEL_INFO_SIZE		11
>> +#define FTS2BA61Y_RESET_CMD_SIZE		5
>> +#define FTS2BA61Y_EVENT_COUNT			31
>> +#define MAX_TRANSFER_SIZE			256
>> +
>> +enum fts2ba61y_regulators {
>> +	FTS2BA61Y_REGULATOR_VDD,
>> +	FTS2BA61Y_REGULATOR_AVDD,
>> +};
>> +
>> +struct fts2ba61y_data {
>> +	struct spi_device *spi;
>> +	struct regulator_bulk_data regulators[2];
>> +	struct input_dev *input_dev;
>> +	struct mutex mutex;
>> +	struct touchscreen_properties prop;
>> +
>> +	u8 tx_count;
>> +
>> +	unsigned int max_x;
>> +	unsigned int max_y;
>> +};
>> +
>> +static int fts2ba61y_write(struct fts2ba61y_data *ts,
>> +			   u8 *reg, int cmd_len, u8 *data, int data_len)
>> +{
>> +	struct spi_message msg;
>> +	struct spi_transfer xfers;
>> +	char *tx_buf;
>> +	int len;
>> +	int ret;
> Please use "error" for variables that only contain error codes or 0.
Okay
>
>> +
>> +	tx_buf = kzalloc(cmd_len + data_len + 1, GFP_KERNEL);
>> +	if (!tx_buf) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
> Instead of allocating and freeing memory on each transfer consider
> allocating tx and rx scratch buffers in fts2ba61y_data structure (either
> as ____cacheline_aligned or as separate allocations).
>
> If you absolutely need a per transfer allocations then use
>
> 	u8 *tx_buf __free(kfree) = kzalloc(...);
Will do
>
>> +
>> +	memset(&xfers, 0, sizeof(xfers));
>> +	spi_message_init(&msg);
>> +
>> +	memcpy(&tx_buf[0], reg, cmd_len);
>> +	if (data_len && data)
>> +		memcpy(&tx_buf[cmd_len], data, data_len);
>> +
>> +	len = cmd_len + data_len;
>> +
>> +	/* custom write cmd */
>> +	if (reg[0] != FTS2BA61Y_CMD_REG_W &&
>> +	    reg[0] != FTS2BA61Y_CMD_REG_R) {
>> +		memmove(tx_buf + 1, tx_buf, len);
>> +		tx_buf[0] = FTS2BA61Y_CMD_CUSTOM_W;
>> +		len++;
>> +	}
>> +
>> +	xfers.len = len;
>> +	xfers.tx_buf = tx_buf;
>> +
>> +	spi_message_add_tail(&xfers, &msg);
>> +
>> +	mutex_lock(&ts->mutex);
> Why is this mutex needed? spi_sync() does the bus lock already, what
> else needs protection. Even with shared scratch buffers I believe the
> driver at any one point would only have one read or write operation in
> progress...
Yeah you're right, the mutex was kept because it was in downstream code. 
Will drop
>> +	ret = spi_sync(ts->spi, &msg);
>> +	if (ret)
>> +		dev_err(&ts->spi->dev, "spi transfer error, %d", ret);
>> +	mutex_unlock(&ts->mutex);
>> +
>> +out:
>> +	kfree(tx_buf);
>> +	return ret;
>> +}
>> +
>> +static int fts2ba61y_spi_raw_read(struct fts2ba61y_data *ts,
>> +				  u8 *tx_buf, u8 *rx_buf, int len)
>> +{
>> +	struct spi_message msg;
>> +	struct spi_transfer xfer;
>> +	int ret;
>> +
>> +	memset(&xfer, 0, sizeof(xfer));
>> +	spi_message_init(&msg);
>> +
>> +	xfer.len = len;
>> +	xfer.tx_buf = tx_buf;
>> +	xfer.rx_buf = rx_buf;
>> +	spi_message_add_tail(&xfer, &msg);
>> +
>> +	mutex_lock(&ts->mutex);
>> +	ret = spi_sync(ts->spi, &msg);
>> +	if (ret)
>> +		dev_err(&ts->spi->dev, "spi transfer error, %d", ret);
>> +	mutex_unlock(&ts->mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * higher-level wrapper that prepares the buffers for a read.
>> + */
>> +static int fts2ba61y_read(struct fts2ba61y_data *ts,
>> +			  u8 reg[], int tx_len, u8 buf[], int rx_len)
> As far as I can see fts2ba61y_read() is always used with a single byte
> command. Why not make it "u8 cmd" or "u8 reg" and drop tx_len.
>
> Same goes for fts2ba61y_write(). Also the read buffer might make sense
> as void * instead of u8 *, so that you do not have to cast.
Alright
>
>> +{
>> +	char *tx_buf, *rx_buf;
>> +	int ret, mem_len;
>> +	u16 reg_val;
>> +
>> +	if (tx_len > 3)
>> +		mem_len = rx_len + 1 + tx_len;
>> +	else
>> +		mem_len = rx_len + 4;
> A commend why we need this "+ 4" would be useful.
Will do
>
>> +
>> +	tx_buf = kzalloc(mem_len, GFP_KERNEL);
>> +	rx_buf = kzalloc(mem_len, GFP_KERNEL);
>> +	if (!tx_buf || !rx_buf) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	switch (reg[0]) {
>> +	case FTS2BA61Y_CMD_READ_EVENT:
>> +	case FTS2BA61Y_CMD_REG_W:
>> +	case FTS2BA61Y_CMD_REG_R:
>> +		memcpy(tx_buf, reg, tx_len);
>> +		break;
>> +
>> +	default:
>> +		tx_buf[0] = FTS2BA61Y_CMD_CUSTOM_R;
>> +
>> +		if (tx_len == 1)
>> +			reg_val = 0;
>> +		else if (tx_len == 2)
>> +			reg_val = reg[0];
>> +		else if (tx_len == 3)
>> +			reg_val = reg[0] | (reg[1] << 8);
>> +		else {
> If one branch has braces all of them have to have braces.
>
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +
>> +		tx_len = 3;
>> +		put_unaligned_be16(reg_val, &tx_buf[1]);
>> +
>> +		ret = fts2ba61y_write(ts, reg, 1, NULL, 0);
>> +		if (ret < 0)
>> +			goto out;
>> +		break;
>> +	}
>> +
>> +	ret = fts2ba61y_spi_raw_read(ts, tx_buf, rx_buf, rx_len + 1 + tx_len);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	memcpy(buf, &rx_buf[1 + tx_len], rx_len);
>> +
>> +out:
>> +	kfree(tx_buf);
>> +	kfree(rx_buf);
>> +	return ret;
>> +}
>> +
>> +static int fts2ba61y_wait_for_ready(struct fts2ba61y_data *ts)
>> +{
>> +	u8 buffer[FTS2BA61Y_EVENT_BUFF_SIZE];
>> +	u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
>> +	u8 status_id, stype;
>> +	int ret;
>> +
>> +	for (int retries = 5; retries > 0; retries--) {
>> +		ret = fts2ba61y_read(ts, &cmd, 1, buffer, FTS2BA61Y_EVENT_BUFF_SIZE);
>> +
>> +		stype = FIELD_GET(FTS2BA61Y_MASK_STYPE, buffer[0]);
>> +		status_id = buffer[1];
>> +
>> +		if (stype == FTS2BA61Y_EVENT_STATUSTYPE_INFO &&
>> +		    status_id == FTS2BA61Y_INFO_READY_STATUS) {
>> +			ret = 0;
>> +			break;
>> +		} else
>> +			ret = -ENODEV;
> "else" needs braces as well.
>
>> +
>> +		msleep(20);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int fts2ba61y_reset(struct fts2ba61y_data *ts)
>> +{
>> +	u8 cmd = FTS2BA61Y_CMD_REG_W;
>> +	/* the following sequence is undocumented */
>> +	u8 reset[FTS2BA61Y_RESET_CMD_SIZE] = { 0x20, 0x00,
>> +					       0x00, 0x24, 0x81 };
>> +	int ret;
>> +
>> +	disable_irq(ts->spi->irq);
>> +
>> +	ret = fts2ba61y_write(ts, &cmd, 1, &reset[0], FTS2BA61Y_RESET_CMD_SIZE);
>> +	if (ret)
>> +		return ret;
> You end up with interrupts disabled on error which may be unexpected.
> Better use
>
> 	guard(disable_irq)(&ts->spi->irq);
>
>> +	msleep(30);
>> +
>> +	ret = fts2ba61y_wait_for_ready(ts);
>> +	if (ret)
>> +		return ret;
>> +
>> +	enable_irq(ts->spi->irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int fts2ba61y_set_channels(struct fts2ba61y_data *ts)
>> +{
>> +	int ret;
>> +	u8 cmd = FTS2BA61Y_CMD_READ_PANEL_INFO;
>> +	u8 data[FTS2BA61Y_PANEL_INFO_SIZE];
>> +
>> +	ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_PANEL_INFO_SIZE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ts->max_x = get_unaligned_be16(data);
>> +	ts->max_y = get_unaligned_be16(data + 2);
>> +
>> +	/* if no tx channels defined, at least keep one */
>> +	ts->tx_count = max_t(u8, data[8], 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int fts2ba61y_set_touch_func(struct fts2ba61y_data *ts)
>> +{
>> +	u8 cmd = FTS2BA61Y_CMD_TOUCHTYPE;
>> +	u16 touchtype = cpu_to_le16(FTS2BA61Y_TOUCHTYPE_DEFAULT);
>> +
>> +	return fts2ba61y_write(ts, &cmd, 1, (u8 *)&touchtype, 2);
>> +}
>> +
>> +static int fts2ba61y_hw_init(struct fts2ba61y_data *ts)
>> +{
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
>> +								ts->regulators);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msleep(140);
>> +
>> +	ret = fts2ba61y_reset(ts);
>> +	if (ret)
>> +		return ret;
> You need to disable regulators on error.
>
>> +
>> +	ret = fts2ba61y_set_channels(ts);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return fts2ba61y_set_touch_func(ts);
> In functions with multiple points of failure do not end with "return
> function_call();". Use standard
>
> 	error = operation(...);
> 	if (error)
> 		return error;
>
> 	return 0;
>
>> +}
>> +
>> +static int fts2ba61y_get_event(struct fts2ba61y_data *ts, u8 *data, int *n_events)
>> +{
>> +	int ret;
>> +	u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
>> +
>> +	ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_EVENT_BUFF_SIZE);
>> +	if (ret < 0)
> fts2ba61y_read() does not return positive success values, so:
>
> 	if (error)
> 		return error;
>
>> +		return ret;
>> +
>> +	if (!data[0]) {
>> +		*n_events = 0;
>> +		return 0;
>> +	}
>> +
>> +	*n_events = FIELD_GET(FTS2BA61Y_MASK_LEFT_EVENTS, data[7]);
>> +	if (unlikely(*n_events >= FTS2BA61Y_EVENT_COUNT)) {
>> +		cmd = FTS2BA61Y_CMD_CLEAR_EVENTS;
>> +		fts2ba61y_write(ts, &cmd, 1, NULL, 0);
>> +		*n_events = 0;
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (*n_events > 0) {
>> +		ret = fts2ba61y_read(ts, &cmd, 1,
>> +				     &data[1 * FTS2BA61Y_EVENT_BUFF_SIZE],
>> +				     FTS2BA61Y_EVENT_BUFF_SIZE * (*n_events));
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void fts2ba61y_report_coordinates(struct fts2ba61y_data *ts,
>> +					 u8 *event, u8 tid)
>> +{
>> +	u8 major = event[4];
>> +	u8 minor = event[5];
>> +	u8 z = FIELD_GET(FTS2BA61Y_MASK_Z, event[6]);
>> +
>> +	u16 x = (event[1] << 4) |
>> +		FIELD_GET(FTS2BA61Y_MASK_X_3_0, event[3]);
>> +	u16 y = (event[2] << 4) |
>> +		FIELD_GET(FTS2BA61Y_MASK_Y_3_0, event[3]);
>> +	u16 ttype = (FIELD_GET(FTS2BA61Y_MASK_TTYPE_3_2, event[6]) << 2) |
>> +		    (FIELD_GET(FTS2BA61Y_MASK_TTYPE_1_0, event[7]) << 0);
>> +
>> +	if (ttype != FTS2BA61Y_TOUCHTYPE_NORMAL &&
>> +	    ttype != FTS2BA61Y_TOUCHTYPE_PALM &&
>> +	    ttype != FTS2BA61Y_TOUCHTYPE_WET &&
>> +	    ttype != FTS2BA61Y_TOUCHTYPE_GLOVE)
>> +		return;
>> +
>> +	input_mt_slot(ts->input_dev, tid);
>> +	input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
>> +	input_report_abs(ts->input_dev, ABS_MT_POSITION_X, x);
>> +	input_report_abs(ts->input_dev, ABS_MT_POSITION_Y, y);
>> +	input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR, major);
>> +	input_report_abs(ts->input_dev, ABS_MT_TOUCH_MINOR, minor);
>> +	input_report_abs(ts->input_dev, ABS_MT_PRESSURE, z);
>> +
>> +	input_mt_sync_frame(ts->input_dev);
>> +	input_sync(ts->input_dev);
>> +}
>> +
>> +static void fts2ba61y_report_release(struct fts2ba61y_data *ts, u8 tid)
>> +{
>> +	input_mt_slot(ts->input_dev, tid);
>> +	input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, false);
>> +
>> +	input_mt_sync_frame(ts->input_dev);
>> +	input_sync(ts->input_dev);
>> +}
>> +
>> +static void fts2ba61y_handle_coordinates(struct fts2ba61y_data *ts, u8 *event)
>> +{
>> +	u8 t_id = FIELD_GET(FTS2BA61Y_MASK_TID, event[0]);
>> +	u8 action = FIELD_GET(FTS2BA61Y_MASK_TCHSTA, event[0]);
>> +
>> +	if (t_id > ts->tx_count)
>> +		return;
>> +
>> +	switch (action) {
>> +	case FTS2BA61Y_COORDINATE_ACTION_PRESS:
>> +	case FTS2BA61Y_COORDINATE_ACTION_MOVE:
>> +		fts2ba61y_report_coordinates(ts, event, t_id);
>> +		break;
>> +
>> +	case FTS2BA61Y_COORDINATE_ACTION_RELEASE:
>> +		fts2ba61y_report_release(ts, t_id);
>> +		break;
>> +	}
>> +}
>> +
>> +static irqreturn_t fts2ba61y_irq_handler(int irq, void *handle)
>> +{
>> +	struct fts2ba61y_data *ts = handle;
>> +	u8 buffer[FTS2BA61Y_EVENT_COUNT * FTS2BA61Y_EVENT_BUFF_SIZE];
>> +	u8 *event;
>> +	u8 event_id;
>> +	int n_events = 0;
>> +	int ret;
>> +
>> +	usleep(1);
> Why?
Must've been added by mistake.
>
>> +
>> +	ret = fts2ba61y_get_event(ts, buffer, &n_events);
>> +	if (ret < 0) {
>> +		dev_dbg(&ts->spi->dev, "failed to get event: %d", ret);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	for (int i = 0; i <= n_events; i++) {
>> +		event = &buffer[i * FTS2BA61Y_EVENT_BUFF_SIZE];
>> +		event_id = FIELD_GET(FTS2BA61Y_MASK_EVENT_ID, event[0]);
>> +
>> +		if (event_id == FTS2BA61Y_COORDINATE_EVENT)
>> +			fts2ba61y_handle_coordinates(ts, event);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int fts2ba61y_input_open(struct input_dev *dev)
>> +{
>> +	struct fts2ba61y_data *ts = input_get_drvdata(dev);
>> +	u8 cmd = FTS2BA61Y_CMD_SENSE_ON;
>> +
>> +	return fts2ba61y_write(ts, &cmd, 1, NULL, 0);
>> +}
>> +
>> +static void fts2ba61y_input_close(struct input_dev *dev)
>> +{
>> +	struct fts2ba61y_data *ts = input_get_drvdata(dev);
>> +	int ret;
>> +	u8 cmd = FTS2BA61Y_CMD_SENSE_OFF;
>> +
>> +	ret = fts2ba61y_write(ts, &cmd, 1, NULL, 0);
>> +	if (ret)
>> +		dev_err(&ts->spi->dev, "failed to turn off sensing\n");
>> +}
>> +
>> +static void fts2ba61y_power_off(void *data)
>> +{
>> +	struct fts2ba61y_data *ts = data;
>> +
>> +	disable_irq(ts->spi->irq);
> This may get called before interrupt is requested. Why does it need to
> be here?
To ensure the interrupt doesn't fire during shutdown.
>
>> +	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
>> +						   ts->regulators);
>> +}
>> +
>> +static int fts2ba61y_probe(struct spi_device *spi) {
>> +	struct fts2ba61y_data *ts;
>> +	struct input_dev *input_dev;
>> +	int error;
>> +
>> +	ts = devm_kzalloc(&spi->dev, sizeof(*ts), GFP_KERNEL);
>> +	if (!ts)
>> +		return -ENOMEM;
>> +
>> +	ts->spi = spi;
>> +	mutex_init(&ts->mutex);
>> +
>> +	spi->mode = SPI_MODE_0;
>> +	spi->bits_per_word = 8;
>> +
>> +	error = spi_setup(spi);
>> +	if (error)
>> +		return error;
>> +
>> +	ts->regulators[FTS2BA61Y_REGULATOR_VDD].supply = "vdd";
>> +	ts->regulators[FTS2BA61Y_REGULATOR_AVDD].supply = "avdd";
>> +	error = devm_regulator_bulk_get(&spi->dev,
>> +									ARRAY_SIZE(ts->regulators),
>> +									ts->regulators);
>> +	if (error)
>> +		return error;
>> +
>> +	error = fts2ba61y_hw_init(ts);
>> +	if (error)
>> +		return error;
>> +
>> +	error = devm_add_action_or_reset(&ts->spi->dev, fts2ba61y_power_off, ts);
>> +	if (error)
>> +		return error;
>> +
>> +	input_dev = devm_input_allocate_device(&spi->dev);
>> +	if (!input_dev)
>> +		return -ENOMEM;
>> +
>> +	ts->input_dev = input_dev;
>> +
>> +	input_dev->name = FTS2BA61Y_DEV_NAME;
>> +	input_dev->id.bustype = BUS_SPI;
>> +	input_dev->open = fts2ba61y_input_open;
>> +	input_dev->close = fts2ba61y_input_close;
>> +
>> +	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
>> +	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
>> +	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>> +	input_set_abs_params(input_dev, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
>> +	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 255, 0, 0);
>> +
>> +	touchscreen_parse_properties(input_dev, true, &ts->prop);
>> +
>> +	spi_set_drvdata(spi, ts);
>> +	input_set_drvdata(input_dev, ts);
>> +
>> +	error = input_mt_init_slots(input_dev, ts->tx_count, INPUT_MT_DIRECT);
>> +	if (error)
>> +		return error;
>> +
>> +	error = input_register_device(input_dev);
>> +	if (error)
>> +		return error;
>> +
>> +	error = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
>> +					  fts2ba61y_irq_handler,
>> +					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> Do not encode interrupt polarity, let device tree specify it according
> to system design. So just IRQF_ONESHOT.
Okay
>
>> +					  "fts2ba61y_irq", ts);
>> +	return error;
>> +}
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id spi_touchscreen_dt_ids[] = {
>> +	{ .compatible = "st,fts2ba61y" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, spi_touchscreen_dt_ids);
>> +#endif
>> +
>> +static const struct spi_device_id fts2ba61y_spi_ids[] = {
>> +	{ "fts2ba61y" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(spi, fts2ba61y_spi_ids);
>> +
>> +static struct spi_driver spi_touchscreen_driver = {
>> +	.driver = {
>> +		.name = FTS2BA61Y_DEV_NAME,
>> +		.of_match_table = of_match_ptr(spi_touchscreen_dt_ids),
>> +	},
>> +	.probe = fts2ba61y_probe,
>> +	.id_table = fts2ba61y_spi_ids,
>> +};
>> +
>> +module_spi_driver(spi_touchscreen_driver);
>> +
>> +MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
>> +MODULE_DESCRIPTION("ST-Microelectronics FTS2BA61Y Touch Screen");
>> +MODULE_LICENSE("GPL");
> Thanks.
Thank you for the review! I will send a v2 soon.

