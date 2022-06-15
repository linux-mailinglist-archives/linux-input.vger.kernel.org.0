Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1DC54CC40
	for <lists+linux-input@lfdr.de>; Wed, 15 Jun 2022 17:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239172AbiFOPMq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jun 2022 11:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241207AbiFOPMp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jun 2022 11:12:45 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2075.outbound.protection.outlook.com [40.92.41.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A64CFE0;
        Wed, 15 Jun 2022 08:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJAo/9kWw40DOVGw9+TsDYhgMV7SFIAm9xeZyh47PZOH/jF/I7luZM+m8ptBFDxGR7j11BFS06pRxCIUCdwTVwGuCm3wRXHpjKbWh3dYWdUlZgxU2DvJRqSeP5yO8dCKOPbLOIa8OwALxCdN8DOqm8SwJ9/3v9+gSZe+wLjA0O+pIlTcC402NZIbM+8WLHcN1XuIFxhqzfAgGv5xwxcf+YqcnEmbbhXEzMKlWCd6kREum3/odo/b4e3OaDO4tRMy/NFkX74m43+nOFSpj/88vm98DW3/HTY0ycpDkMpQMY6Z+N3xHEcfXqHZ6t0wNcM0X2eTt34iyNF5FeRxQEPUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpmFStLhLVqf2kk2i/9KHqkRXE2QFYiQWdvXty9HNUI=;
 b=hJNXNquQ2ZeEi/1877Css1rbN7TJIobA3a20zwSV7uRF2c0pVbRF4y2GQTKjQ4F3MJDJGnmKqq3SeGyBWmKFADm5JLhpMxUniBYrxfDyIvphT26lkeHa5zuddpX5UMjDdq41oQ4HuCFfbNko4kc/Ycaf7LjKufAjkspQC/bVixZJuK32Cc+nSU0ZMunHMYuW/VFc//znv0qO2FcbHtFfIDoSupVv7SSArMZhSe+7ptJu7fE/YozNSn7//t3JwBUcMgK6WoE0w7X0TTDrpFi8akrSja0Q1fZbEglKjAy94KwhwJJwe6qmF3L5r1bHlLZgMwm/Vtidbw8AAH3C3wJOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpmFStLhLVqf2kk2i/9KHqkRXE2QFYiQWdvXty9HNUI=;
 b=Hray2d3+q1WMpLg75ommCcvPEKYGOTaKlX48tRKl8cgbwuiQ45DcJ5B6CkVyAhluPFmzVQZ87wbE50egxsvAJtbCHuJ+JOnopc/Nt1PJ5aNZzGWu3RY1glxRJaoKD+7ddsA0IqIrOsHnAn8di6HxssXJo9ONFRWUa84DWwXEGpjNXUKinpTHY+Iww3MT63TWhNdO5vFytFw7/XTYEE8pqx+9GwaqvbjHNqCzr7LAnKVUrilf5rIMxWPvz610qNSZ+qhLcq0dNcBKt/6iuwniIJk8HKGa7hPNxEo2t1tZZMnYNeKE6bbUtDXv0bniqzWG1HWc26Nl494skXyHcj8oNw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BYAPR06MB5477.namprd06.prod.outlook.com (2603:10b6:a03:dd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Wed, 15 Jun
 2022 15:12:42 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 15:12:42 +0000
Date:   Wed, 15 Jun 2022 10:12:38 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, maccraft123mc@gmail.com,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 2/3] Input: adc-joystick - Add polled input device
 support
Message-ID: <SN6PR06MB5342762DE16AFC607CA9D5F9A5AD9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
 <20220613192353.696-3-macroalpha82@gmail.com>
 <ec496fcf808d73fe356d1961d89bf1ff@artur-rojek.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec496fcf808d73fe356d1961d89bf1ff@artur-rojek.eu>
X-TMN:  [AqF9NNQuZ1OQdYWNnq32lQ5/Ur8BclCB]
X-ClientProxiedBy: SA9PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:806:24::27) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220615151238.GA13141@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ebd4bc-472b-4cf6-427c-08da4ee17dd9
X-MS-TrafficTypeDiagnostic: BYAPR06MB5477:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2C8z3lN0RB/tYbR+Agoh9yt9e5oiAOrPoajjqn8hvF4Nf6QiPS5eda1sn3xZwQyaLBPL0mHdUCE2ct02cf6ol7mbirWTKU/0jo2WtRIdNMIR8hxOX9ITzTioo6ym+3Uh/Jw7DvLg/LtegaE23p4TevVLoYA0YPgKtP+vruHK3R8RxL/wbKBOBUPiLVgq7fiJH90P+EdkmVkSd6z7q2chZAwKFGeGU+O48KIIzgee7tnjlKYb2viTQYvW7zv/6Lom4FaGWEiwBO3sgw3IviwdSKXVYBzq/2X4zSCBPCQP2+3Y3UpzPEFYDrOpYAUh0otBjK/wjdCmw3AHk4tZhV4DKfJ0T78BFW8yVxb6E5/kuXsRPJuXWQBYBPWZzxUuvxdjSeUn61V2o+wRaEIQDUIqf4IQm0eND4UShWnbEB62KBQicoD00Ew+QdLkYOhOzHDjAr0YenDkLDaWojiiprMywfmz+9qwcjvVfiNfWI3XlWApyigZFwgLLSypKd4cOqn2PjYY+EMdase0IzsEzr/adDQhVLojP0Ccu63pcvowK4FULC9EPxwziEUT8l+BcF/T42p0WfQyEL6VtMXs4dCLQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyG3BGb06Ub3tI/1mDe/KguZLTfUIOMOz7wwKREd14lWxLBfUh6wQxH1b58q?=
 =?us-ascii?Q?tTakQEBnpU140tq0f/B5JeMVE9mil6+NYfbvdRjvXMuEc5mRmZC0KsdVdNMU?=
 =?us-ascii?Q?InnrRRZ7hoIiV7h+1HBtOA5zf3jO8DYi6d0pG2s4oXZF2LnQJlN7L21qexvJ?=
 =?us-ascii?Q?aV7EQYruVdwwCIomYGfJ4F+BqAkj8t7zK1ZhiV+TcNUojPkDbIKsI0nR12pB?=
 =?us-ascii?Q?9IVn8z9Lh4M1m3glRZluKYL6O6tpgvbl8KyeqftdOWUwaB1mBXY/CEnW2bdZ?=
 =?us-ascii?Q?Oh56uj4fo2yoB+IPy1pbieAOv3h6Kfan7Wxj6Rt0VEIGY+IfBTA7IfnYuKHF?=
 =?us-ascii?Q?LxmJvgDUkRaJByf5vkwO6HqVvBfSU+3j6oHmrbyv5ClkPsSDJp9lQWI7l8pe?=
 =?us-ascii?Q?uxo+UTO7W4KvH0gL/hWo+RcM30knnFo5gM8l4I6cvvOvVig09wvaAaEZx8sE?=
 =?us-ascii?Q?JpwjcJe5yTiSE5lL6QqY2d2sS5b1tn0GgH1GPu8BIMRDnu1ZKFZ4TW94SxFj?=
 =?us-ascii?Q?yClSctpN6k2IwHbk4E7eqetCCe81B+BtuQpzkPMHG6ZhxXh9iUNbNBf/StTj?=
 =?us-ascii?Q?y3cDs6W97dMoE44sUG2FnPsJaB7kZbhAjITunh5YlgahmFIJAuc8RkrJJ1Lj?=
 =?us-ascii?Q?4lXGL2ZmTsbHvzfUEPtJ0L5b7KoHcxvx5HG/QWzwqB65DpQWvgrUfo6Mzkch?=
 =?us-ascii?Q?iPIQtnK9f8w8bDD8blqf36lRORTuW6qT3X8cL9hWhNyzd9dxEQ1cAkpB9lax?=
 =?us-ascii?Q?BOhtxAWbr1Ml/kLXJzGlXverdxFoQaG4KuNS3jHuYr7acrZ0/N9EDtd6S0Jh?=
 =?us-ascii?Q?R4/04KOZE+lFX5QhXR5ceIMn+g/KSWOV+qTbqNv/Fys0XUektXosGpWvT4xK?=
 =?us-ascii?Q?9PCAWEsBCRJL8D48ml6BTUluzIGHnwRSF13LwkplkUQSoxLAo+djW9BYga9s?=
 =?us-ascii?Q?lDmf2JRjW/11F0KCHw+gBPG8q3NZe4JPuk75ZX0C4XnqTqeAKsIrmWlNe/TI?=
 =?us-ascii?Q?k58zYmhGzDExoi5Omb0Ke5WWnsmLkOzBHmN5aot2p/qwtjjps8LD5tGp+Xbr?=
 =?us-ascii?Q?NH0RrDX+Tc7Go2L8W/q+dw9Pm4sfxzpaRsxomPGeeB/49PvR3fp2zCoMf055?=
 =?us-ascii?Q?PgaEmHA9AwCxxlpxgEinJGRZ8zTOONCp8lIhJeGdrlOGjt8W3Qs4KMSg0eEf?=
 =?us-ascii?Q?1d6GnIlQlfFDssD5XF88YCgn5iSTFyCd3SKr/RHNb+0VxEggqIcEuSkSyMuL?=
 =?us-ascii?Q?qM1UZ83DzNXs3vzJuFWt2rmxIYOnHeQtviYl+5F8zNYUxQDTIRw+5HJwsqdR?=
 =?us-ascii?Q?0QN+h0iCfgYCuCm7H8uqImHlInMQdsMmWoQ4eJZNmaUVHc0TaOM9BaXwlxaM?=
 =?us-ascii?Q?ANveeTsRuEBnXr9Vwzqh5qenl25Gunh/9xVtBx0cQtTMTVs7JFb/9uPwoegV?=
 =?us-ascii?Q?DbN2tim7Pao=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ebd4bc-472b-4cf6-427c-08da4ee17dd9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 15:12:41.9688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB5477
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 15, 2022 at 03:43:07AM +0200, Artur Rojek wrote:
> On 2022-06-13 21:23, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add polled input device support to the adc-joystick driver. This is
> > useful for devices which do not have hardware capable triggers on
> > their SARADC. Code modified from adc-joystick.c changes made by Maya
> > Matuszczyk.
> > 
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Hi Chris,
> 
> Comments inline. I also Cc'd Paul and Jonathan, who were attached in v2.
> 
> > ---
> >  drivers/input/joystick/adc-joystick.c | 52 +++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/adc-joystick.c
> > b/drivers/input/joystick/adc-joystick.c
> > index 78ebca7d400a..dc01cd0214d2 100644
> > --- a/drivers/input/joystick/adc-joystick.c
> > +++ b/drivers/input/joystick/adc-joystick.c
> > @@ -13,6 +13,10 @@
> > 
> >  #include <asm/unaligned.h>
> > 
> > +#define ADC_JSK_POLL_INTERVAL	16
> > +#define ADC_JSK_POLL_MIN	8
> > +#define ADC_JSK_POLL_MAX	32
> > +
> >  struct adc_joystick_axis {
> >  	u32 code;
> >  	s32 range[2];
> > @@ -26,8 +30,21 @@ struct adc_joystick {
> >  	struct adc_joystick_axis *axes;
> >  	struct iio_channel *chans;
> >  	int num_chans;
> > +	bool polled;
> >  };
> > 
> > +static void adc_joystick_poll(struct input_dev *input)
> > +{
> > +	struct adc_joystick *joy = input_get_drvdata(input);
> > +	int i, val;
> > +
> > +	for (i = 0; i < joy->num_chans; i++) {
> > +		iio_read_channel_raw(&joy->chans[i], &val);
> > +		input_report_abs(input, joy->axes[i].code, val);
> > +	}
> > +	input_sync(input);
> > +}
> > +
> >  static int adc_joystick_handle(const void *data, void *private)
> >  {
> >  	struct adc_joystick *joy = private;
> > @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct
> > platform_device *pdev)
> >  	joy->input = input;
> >  	input->name = pdev->name;
> >  	input->id.bustype = BUS_HOST;
> > -	input->open = adc_joystick_open;
> > -	input->close = adc_joystick_close;
> > +
> > +	if (device_property_read_bool(dev,
> > "adc-joystick,no-hardware-trigger"))
> > +		joy->polled = 1;
> As mentioned in v2, I don't think a DT property is required here. Assuming
> the polled mode is a fallback for devices with no buffers, just do:
> ```
> 	joy->polled = !(joy->chans[0].indio_dev->modes &
> 			INDIO_ALL_BUFFER_MODES);
> ```

Understood. I attempted this and noticed that it was showing I have
INDIO_BUFFER_TRIGGERED in addition to INDIO_DIRECT_MODE (the
INDIO_DIRECT_MODE is the only one specified at the hardware level
though). Should I just check for INDIO_BUFFER_SOFTWARE &
INDIO_BUFFER_HARDWARE instead? I think it's possible that the inclusion
of the industrialio_triggered_buffer module in my kernel is adding
this to the channel somehow?

Thank you.

> > +
> > +	if (joy->polled) {
> > +		input_setup_polling(input, adc_joystick_poll);
> > +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
> > +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
> > +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
> > +	} else {
> > +		input->open = adc_joystick_open;
> > +		input->close = adc_joystick_close;
> > +	}
> > 
> >  	error = adc_joystick_set_axes(dev, joy);
> >  	if (error)
> > @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct
> > platform_device *pdev)
> >  		return error;
> >  	}
> > 
> > -	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> > -	if (IS_ERR(joy->buffer)) {
> > -		dev_err(dev, "Unable to allocate callback buffer\n");
> > -		return PTR_ERR(joy->buffer);
> > -	}
> > +	if (!joy->polled) {
> > +		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> Please maintain line discipline of 80 chars to stay consistent with the rest
> of this driver.

Understood, sorry about that.

> > +		if (IS_ERR(joy->buffer)) {
> > +			dev_err(dev, "Unable to allocate callback buffer\n");
> > +			return PTR_ERR(joy->buffer);
> > +		}
> > 
> > -	error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
> > joy->buffer);
> > -	if (error)  {
> > -		dev_err(dev, "Unable to add action\n");
> > -		return error;
> > +		error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
> > joy->buffer);
> Same here.

Ditto.

> 
> Cheers,
> Artur
> > +		if (error)  {
> > +			dev_err(dev, "Unable to add action\n");
> > +			return error;
> > +		}
> >  	}
> > 
> >  	return 0;
