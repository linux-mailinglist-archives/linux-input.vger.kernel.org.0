Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4303B691258
	for <lists+linux-input@lfdr.de>; Thu,  9 Feb 2023 22:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjBIVBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Feb 2023 16:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjBIVBl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Feb 2023 16:01:41 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32343C64E
        for <linux-input@vger.kernel.org>; Thu,  9 Feb 2023 13:01:37 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id l201so2979378ybf.10
        for <linux-input@vger.kernel.org>; Thu, 09 Feb 2023 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kRymlVwLANM+2BndZj52kIP1SG2WPzhe274FWVd+TWk=;
        b=GYJl10KhchUr5fRUNv3KEWdNCkYlAKHDBkPGUKy6IYTsjHceFqMD/Gl3e4EQKq1x2r
         i64uPRuZ9kHI40liYvHSCQQv3Ii9+BDLLhwf+OtDhMJdFh8QLK53kuDHTNog1O+Kjw/4
         6lfauPRnRvYF1rYXS8ebctpeNAp/97OPdDRO/hnKX/qVpQuSi44rCpUwBomvKLP1Ylf9
         KMD/Lhxzra0AlV7mztFAD17VrAg+aQbTbSZ0hFriSSdQdRBProm88dEtLg0PWvC4pyLV
         eX6zpMovvvJQvTKMEccZt7yka0gABsRHT2mqNFi+ViAgkp+lzfL8L1IJbhDKh5H5+oC4
         RfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRymlVwLANM+2BndZj52kIP1SG2WPzhe274FWVd+TWk=;
        b=Cv6mmqrSbNoZIEnLAgCTKNBrTE2/rBktcF0ayKV3/vUPvzNbokuGVgCI9JP6FiybyU
         Gl/3Ebu7k2fr1JhtClUbjHKlQ5uLOk5RiYiN6Mo/dSkTXE8JtiN38C3gSwHFryK1VqP2
         D5SLjIxytcOHrKyMS/87FcArgMhhZ6hrH0WMnwStqBvQ9oJMOO4TpQoStf+EOVBbXrkP
         hIQ3tOjAi7AMoq+o2IJ2NnfkIcG+iNFz/RVNICOgaHKhQr1We6TKDRkw6MJbrs9tOG63
         E2ZRfnd+xk7dliufv7itaKCwG5aZJMVqbwkmJa5xSWUmmKvQFivlNsjb4P34ajAEHf9v
         HoGA==
X-Gm-Message-State: AO0yUKVUrXUk8PBuLvgXXaOGnS6TpBgMOE6fYdu3gJPTHTSEt5TLt3YE
        BQPDrfCJCZlfO+n0+vBebpENQzT/HLvi7gENEz5l8g==
X-Google-Smtp-Source: AK7set9CcU5eqJ2xx6feLzQdSjYtmHkadI2u/XueUgTsj3/bIaOz4tMDkeDVPsKwfrZsAyWl7X2zpubQUT+9LvODDfo=
X-Received: by 2002:a5b:4d:0:b0:8ce:ad3d:d37d with SMTP id e13-20020a5b004d000000b008cead3dd37dmr552588ybp.117.1675976496401;
 Thu, 09 Feb 2023 13:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20230205145450.3396-1-kaehndan@gmail.com> <20230205145450.3396-5-kaehndan@gmail.com>
 <20230206163912.GA182582-robh@kernel.org>
In-Reply-To: <20230206163912.GA182582-robh@kernel.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Thu, 9 Feb 2023 22:01:25 +0100
Message-ID: <CACMJSeuP9sVcadnD+yL5LGOcxGkJnyn7DKQB2=GUcZW2FUdC0A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] HID: cp2112: Devicetree Support
To:     Rob Herring <robh@kernel.org>
Cc:     Danny Kaehn <kaehndan@gmail.com>,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 6 Feb 2023 at 17:39, Rob Herring <robh@kernel.org> wrote:
>
> +Bartosz
>
> On Sun, Feb 05, 2023 at 08:54:50AM -0600, Danny Kaehn wrote:
> > Bind i2c and gpio interfaces to subnodes with names
> > "i2c" and "gpio" if they exist, respectively. This
> > allows the gpio and i2c controllers to be described
> > in DT as usual. Additionally, support configuring the
> > i2c bus speed from the clock-frequency property.
> >
> > Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> > ---
> >  drivers/hid/hid-cp2112.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> > index 27cadadda7c9..aa634accdfb0 100644
> > --- a/drivers/hid/hid-cp2112.c
> > +++ b/drivers/hid/hid-cp2112.c
> > @@ -1234,6 +1234,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >       u8 buf[3];
> >       struct cp2112_smbus_config_report config;
> >       struct gpio_irq_chip *girq;
> > +     struct i2c_timings timings;
> >       int ret;
> >
> >       dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
> > @@ -1292,6 +1293,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >               goto err_power_normal;
> >       }
> >
> > +     dev->adap.dev.of_node   = of_get_child_by_name(hdev->dev.of_node, "i2c");
> > +     i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
> > +
> > +     config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
> >       config.retry_time = cpu_to_be16(1);
> >
> >       ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),
> > @@ -1300,7 +1305,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >               hid_err(hdev, "error setting SMBus config\n");
> >               if (ret >= 0)
> >                       ret = -EIO;
> > -             goto err_power_normal;
> > +             goto err_free_i2c_of;
> >       }
> >
> >       hid_set_drvdata(hdev, (void *)dev);
> > @@ -1322,7 +1327,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >
> >       if (ret) {
> >               hid_err(hdev, "error registering i2c adapter\n");
> > -             goto err_power_normal;
> > +             goto err_free_i2c_of;
> >       }
> >
> >       hid_dbg(hdev, "adapter registered\n");
> > @@ -1336,6 +1341,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >       dev->gc.ngpio                   = 8;
> >       dev->gc.can_sleep               = 1;
> >       dev->gc.parent                  = &hdev->dev;
> > +#if IS_ENABLED(CONFIG_OF_GPIO)
> > +     dev->gc.of_node                 = of_get_child_by_name(hdev->dev.of_node, "gpio");
> > +#endif
>
> The scarcity of CONFIG_OF_GPIO ifdefs in the tree tells me this is
> wrong. I think you want to use the fwnode pointer instead. GPIO
> maintainers should review this.
>
> Rob

Yep, we're moving away from OF in favor of fwnode - so you'd need to
use device_get_named_child_node() and assign gc.fwnode.

Bart
