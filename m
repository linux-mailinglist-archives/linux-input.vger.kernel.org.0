Return-Path: <linux-input+bounces-13961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A8B24547
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F1A7B639E
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 09:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661812D0635;
	Wed, 13 Aug 2025 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9izWOhO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4527280E;
	Wed, 13 Aug 2025 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755076971; cv=none; b=S5HZu4VKXkyL2Uyj2ieHJ1suPj2S2PpYykPWDd58mlPj2yoP9UtnheZRjHfz4xbxjoYx4mKO5dgbzweLPVKjcBPd+s6CL/8pTBmnIhnNKGVkmKgviAhVNFlpto8p++Ge1hqL7wO4pBXU7bupX6+BIGuFo7RZmqoGSB7xHsHr12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755076971; c=relaxed/simple;
	bh=UJ6PoPZKaB+wc7QI6U+4j6Wr1WwoxnR96ZaPlG0tLxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVSx5pGzERB2yZjPRN2fpxFlcWpJSj64JdJY4V17vuqbe224JMM0Skq4MTjn9pUk17rzdG7HHAIKm+vZy5j09S/Gm1oJlrdLPPTQVVGbL+THjj7Cx9gM7bdp7uNzYgYsojzzXYDwk5zSm1R/R3YIvme4jjwyX4yNZUV03WRPCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9izWOhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DC9C4CEEB;
	Wed, 13 Aug 2025 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755076970;
	bh=UJ6PoPZKaB+wc7QI6U+4j6Wr1WwoxnR96ZaPlG0tLxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9izWOhO7HOrikGGJXYcZrFPSrQ5AZNNjbzkUg3M+JFcXQvuGAHZDuLio060JUf68
	 gfV/vM3pkhH4I7+gVacu2Rfe+QQTm2g5BXeOGRI+pItzUzsO3uy1uqdtZAYtJKcyXn
	 YkWDXayaKfQqEEstxs2kcI6hcrRglU2OW0H29lk0SShHt2ro/Xio7KFjI0OoOHZpw+
	 lEr/SSzQxxyksWEGkxBIAihDX+peDZPZlxy2W3uhhN1nClgOr0O/Zos/GvPyrWxBT3
	 ijNGLeXUVSSqdms4VGGglzi501bzU5c+iwy8kxVlrrIv/xCZFXWw0Mc11uTH4eu/C2
	 Lrjz+pfTFH6Hg==
Date: Wed, 13 Aug 2025 11:22:45 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v2 11/11] HID: multitouch: add haptic multitouch support
Message-ID: <kmjgxgsdh26okjvhbezl7uskedv3ybio2v6qk3zynlswkxaw4e@dhb43oyrxp44>
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
 <20250804-support-forcepads-v2-11-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-support-forcepads-v2-11-138ca980261d@google.com>

On Aug 04 2025, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> Add new option (MULTITOUCH_HAPTIC) to mark whether hid-multitouch
> should try and configure simple haptic device.
> Once this option is configured, and the device is recognized to have simple
> haptic capabilities, check input frames for pressure and handle it using
> hid_haptic_* API.

Why creating a new option? It seems it'll add unwanted work from
distributions when we should have something that "just works" no?

It makes sense to depend on FF, but adding a new option is probably
useless IMO.


> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  drivers/hid/Kconfig          |  11 ++++
>  drivers/hid/Makefile         |   2 +-
>  drivers/hid/hid-haptic.h     |  52 +++++++++++++++++
>  drivers/hid/hid-multitouch.c | 136 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 199 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index ad6bcc4248cc111705d7cfde2b1481b46353e2d7..b7452f11a4f914f92af582ed054d42ecbcd6cb9e 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -817,6 +817,17 @@ config HID_MULTITOUCH
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hid-multitouch.
>  
> +config MULTITOUCH_HAPTIC
> +	bool "Simple haptic multitouch support"
> +	depends on HID_MULTITOUCH
> +	select HID_HAPTIC
> +	default n
> +	help
> +	Support for simple multitouch haptic devices.
> +	Adds extra parsing and FF device for the hid multitouch driver.
> +	It can be used for Elan 2703 haptic touchpad.
> +	To enable, say Y.
> +
>  config HID_NINTENDO
>  	tristate "Nintendo Joy-Con, NSO, and Pro Controller support"
>  	depends on NEW_LEDS
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 361a7daedeb85454114def8afb5f58caeab58a00..be09b4f13b2058a0a1d7eab79f35def758120fc4 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -4,7 +4,7 @@
>  #
>  hid-y			:= hid-core.o hid-input.o hid-quirks.o
>  hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
> -hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
> +hid-$(CONFIG_MULTITOUCH_HAPTIC)	+= hid-haptic.o
>  
>  obj-$(CONFIG_HID_BPF)		+= bpf/
>  
> diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> index 0a34b0c6d706a985630962acc41f7a8eb73cd343..808cec0b4e51eba1f58b839f3e552493655b7899 100644
> --- a/drivers/hid/hid-haptic.h
> +++ b/drivers/hid/hid-haptic.h
> @@ -58,6 +58,7 @@ struct hid_haptic_device {
>  	struct hid_haptic_effect stop_effect;
>  };
>  
> +#ifdef CONFIG_MULTITOUCH_HAPTIC

There is something wrong with your ifdef usages:
- here, you define the functions below conditionally to
	CONFIG_MULTITOUCH_HAPTIC, which is fine
- but in hid-multitouch, you also check for CONFIG_MULTITOUCH_HAPTIC
	before calling the same set of functions.

Either only define the haptic functions when CONFIG_MULTITOUCH_HAPTIC is
set, and in multitouch check for that define, or define it conditionally
and remove the checks in hid-multitouch (but probably add a comment).

>  void hid_haptic_feature_mapping(struct hid_device *hdev,
>  				struct hid_haptic_device *haptic,
>  				struct hid_field *field, struct hid_usage
> @@ -77,3 +78,54 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
>  void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
>  void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
>  				  __s32 pressure);
> +#else
> +static inline
> +void hid_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage
> +				*usage)
> +{}
> +static inline
> +bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field)
> +{
> +	return false;
> +}
> +static inline
> +int hid_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max)
> +{
> +	return 0;
> +}
> +static inline
> +int hid_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi)
> +{
> +	return 0;
> +}
> +static inline
> +void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
> +{}
> +static inline
> +int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
> +{
> +	return 0;
> +}
> +static inline
> +void hid_haptic_handle_press_release(struct hid_haptic_device *haptic) {}
> +static inline
> +bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
> +{
> +	return false;
> +}
> +static inline
> +void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
> +static inline
> +void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
> +				  __s32 pressure)
> +{}
> +#endif
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index b41001e02da7e02d492bd85743b359ed7ec16e7f..4ff9ac5022b13a0739dbc7ae5f6ebd84f0114a73 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -49,6 +49,8 @@ MODULE_LICENSE("GPL");
>  
>  #include "hid-ids.h"
>  
> +#include "hid-haptic.h"
> +
>  /* quirks to control the device */
>  #define MT_QUIRK_NOT_SEEN_MEANS_UP	BIT(0)
>  #define MT_QUIRK_SLOT_IS_CONTACTID	BIT(1)
> @@ -167,11 +169,13 @@ struct mt_report_data {
>  struct mt_device {
>  	struct mt_class mtclass;	/* our mt device class */
>  	struct timer_list release_timer;	/* to release sticky fingers */
> +	struct hid_haptic_device *haptic;	/* haptic related configuration */
>  	struct hid_device *hdev;	/* hid_device we're attached to */
>  	unsigned long mt_io_flags;	/* mt flags (MT_IO_FLAGS_*) */
>  	__u8 inputmode_value;	/* InputMode HID feature value */
>  	__u8 maxcontacts;
>  	bool is_buttonpad;	/* is this device a button pad? */
> +	bool is_haptic_touchpad;	/* is this device a haptic touchpad? */
>  	bool serial_maybe;	/* need to check for serial protocol */
>  
>  	struct list_head applications;
> @@ -490,6 +494,95 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
>  	kfree(buf);
>  }
>  
> +#if defined(CONFIG_MULTITOUCH_HAPTIC)
> +static int mt_haptic_init(struct hid_device *hdev,
> +				struct hid_haptic_device **haptic_ptr)
> +{
> +	return hid_haptic_init(hdev, haptic_ptr);
> +}
> +
> +static void mt_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage *usage)
> +{
> +	return hid_haptic_feature_mapping(hdev, haptic, field, usage);
> +}
> +
> +static bool mt_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field)
> +{
> +	return hid_haptic_check_pressure_unit(haptic, hi, field);
> +}
> +
> +static void mt_haptic_pressure_reset(struct hid_haptic_device *haptic)
> +{
> +	return hid_haptic_pressure_reset(haptic);
> +}
> +
> +static void mt_haptic_pressure_increase(struct hid_haptic_device *haptic,
> +				 __s32 pressure)
> +{
> +	return hid_haptic_pressure_increase(haptic, pressure);
> +}
> +
> +static int mt_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max)
> +{
> +	return hid_haptic_input_mapping(hdev, haptic, hi, field, usage, bit, max);
> +}
> +
> +static int mt_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi)
> +{
> +	return hid_haptic_input_configured(hdev, haptic, hi);
> +}
> +#else
> +static int mt_haptic_init(struct hid_device *hdev,
> +				struct hid_haptic_device **haptic_ptr)
> +{
> +	return 0;
> +}
> +
> +static void mt_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage *usage)
> +{}
> +
> +static bool mt_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field)
> +{
> +	return 0;
> +}
> +
> +static void mt_haptic_pressure_reset(struct hid_haptic_device *haptic)
> +{}
> +
> +static void mt_haptic_pressure_increase(struct hid_haptic_device *haptic,
> +				 __s32 pressure)
> +{}
> +
> +static int mt_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max)
> +{
> +	return 0;
> +}
> +
> +static int mt_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi)
> +{
> +	return 0;
> +}
> +#endif
> +
> +
>  static void mt_feature_mapping(struct hid_device *hdev,
>  		struct hid_field *field, struct hid_usage *usage)
>  {
> @@ -525,6 +618,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
>  			mt_get_feature(hdev, field->report);
>  		break;
>  	}
> +
> +	mt_haptic_feature_mapping(hdev, td->haptic, field, usage);
>  }
>  
>  static void set_abs(struct input_dev *input, unsigned int code,
> @@ -856,6 +951,9 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  		case HID_DG_TIPPRESSURE:
>  			set_abs(hi->input, ABS_MT_PRESSURE, field,
>  				cls->sn_pressure);
> +			td->is_haptic_touchpad =
> +				mt_haptic_check_pressure_unit(td->haptic,
> +							       hi, field);
>  			MT_STORE_FIELD(p);
>  			return 1;
>  		case HID_DG_SCANTIME:
> @@ -980,6 +1078,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
>  
>  	app->num_received = 0;
>  	app->left_button_state = 0;
> +	if (td->is_haptic_touchpad)
> +		mt_haptic_pressure_reset(td->haptic);
>  
>  	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
>  		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
> @@ -1137,6 +1237,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>  			minor = minor >> 1;
>  		}
>  
> +		if (td->is_haptic_touchpad)
> +			mt_haptic_pressure_increase(td->haptic, *slot->p);
> +
>  		x = hdev->quirks & HID_QUIRK_X_INVERT ?
>  			input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x :
>  			*slot->x;
> @@ -1324,6 +1427,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
>  	if (cls->is_indirect)
>  		app->mt_flags |= INPUT_MT_POINTER;
>  
> +	if (td->is_haptic_touchpad)
> +		app->mt_flags |= INPUT_MT_TOTAL_FORCE;
> +
>  	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
>  		app->mt_flags |= INPUT_MT_DROP_UNUSED;
>  
> @@ -1359,6 +1465,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  	struct mt_device *td = hid_get_drvdata(hdev);
>  	struct mt_application *application;
>  	struct mt_report_data *rdata;
> +	int ret;
>  
>  	rdata = mt_find_report_data(td, field->report);
>  	if (!rdata) {
> @@ -1421,6 +1528,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  	if (field->physical == HID_DG_STYLUS)
>  		hi->application = HID_DG_STYLUS;
>  
> +	ret = mt_haptic_input_mapping(hdev, td->haptic, hi, field, usage, bit,
> +				       max);
> +	if (ret != 0)
> +		return ret;
> +
>  	/* let hid-core decide for the others */
>  	return 0;
>  }
> @@ -1635,6 +1747,14 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	struct hid_report *report;
>  	int ret;
>  
> +	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
> +	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
> +		if (mt_haptic_input_configured(hdev, td->haptic, hi) == 0)
> +			td->is_haptic_touchpad = false;
> +	} else {
> +		td->is_haptic_touchpad = false;
> +	}
> +
>  	list_for_each_entry(report, &hi->reports, hidinput_list) {
>  		rdata = mt_find_report_data(td, report);
>  		if (!rdata) {
> @@ -1764,7 +1884,6 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	int ret, i;
>  	struct mt_device *td;
>  	const struct mt_class *mtclass = mt_classes; /* MT_CLS_DEFAULT */
> -

unrelated change (line removed).

>  	for (i = 0; mt_classes[i].name ; i++) {
>  		if (id->driver_data == mt_classes[i].name) {
>  			mtclass = &(mt_classes[i]);
> @@ -1777,6 +1896,10 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
>  		return -ENOMEM;
>  	}
> +	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);

Please make use of the devm api, you are leaking the allocated memory in
the regular case (AFAICT).

> +	if (!td->haptic)
> +		return -ENOMEM;

One extra blank line wouldn't hurt here :)

> +	td->haptic->hdev = hdev;
>  	td->hdev = hdev;
>  	td->mtclass = *mtclass;
>  	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
> @@ -1840,6 +1963,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  
>  	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
>  
> +	if (td->is_haptic_touchpad) {
> +		if (mt_haptic_init(hdev, &td->haptic)) {
> +			dev_warn(&hdev->dev, "Cannot allocate haptic for %s\n",
> +				 hdev->name);
> +			td->is_haptic_touchpad = false;
> +			kfree(td->haptic);
> +		}
> +	} else {
> +		kfree(td->haptic);
> +	}
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.50.1.565.gc32cd1483b-goog
> 

Cheers,
Benjamin

