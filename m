Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F945F9DAD
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbiJJLfy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 07:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbiJJLfv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 07:35:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99536F247
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 04:35:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w18so16590953wro.7
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/m3YGhhPu66NnLZ8OTGBFyhCL/aregHqBOKFGJMu8RI=;
        b=SlBR0mUOBrnMlRaGPMEN4pEGRDLh9RN7WrgMjr7Msd7e3yKY0ahyw6ur4osbjqW5NF
         3SlpVJz44i6g+DXryRxkGCMRTPPViOT/15DA+B8zYx7ctnLKV7/1168CA4xn+Yw83ME7
         MUw7I1tssvarlnKNdt7UfR89Z19ufmnzxWyMlQxAJHkWU9fyj3YS4MDJf51rojOfMB9F
         x7eZkrtmmJJsRj0W5A+t86jSlYXRYVZ3vO3DC6G2mlRLYvvCRJNC8ekxs6mrxA/l0UHe
         ehHun1ryyDMJeU/eva90C+3Qr2QjEPWNUVbBlAC0v/YL/lYgl4YAxpnYj9EP49tKvmLa
         +Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/m3YGhhPu66NnLZ8OTGBFyhCL/aregHqBOKFGJMu8RI=;
        b=7xxWsfZYExKpUKcXiT+gXZ7aq/TuwK2b57JfUDnIJuEm90JlQ1XDcp91E7dK5Ur435
         82udz5M678NA2r/1MSIB2cZsj0N5U7hUvpnHZ68SBEiBP2RdWRUQkt/Bk3zx/luLatGm
         nhbpGjpjCQKZJT6E2F7wPT4OIZZSbwVvedBeyzJaB5olMamFtuncAEHZiNoRXUePw40M
         NIXtEAe0jnRBm/HkVGJSqyQ5HI0pdGSTIPTGXhwKNrm6vnjawudc3lBvgB0Wz9izdmQs
         GxuKVS1bdj8ob2ZDS5Ok/DXyLp9Jza98J8rvfqASHsSzqe8Z2phjZBwPkM5Goi8FWXMB
         ubkA==
X-Gm-Message-State: ACrzQf0/noyH5ZBim3QSpk0wst3dSRhevBHKS4vDRxANfitTNNieGP1d
        X3KXFaB3dvmOdZHgywJwLOtzjv/jfA==
X-Google-Smtp-Source: AMsMyM60dGeZRK0cDCZdyG9HIoDLzcY5xEQX025cnQFCBHbqtEhEExgHLnTVZVhrLV19C1OWd5rQBg==
X-Received: by 2002:a5d:6f17:0:b0:22e:33e7:6f6c with SMTP id ay23-20020a5d6f17000000b0022e33e76f6cmr10904175wrb.201.1665401746446;
        Mon, 10 Oct 2022 04:35:46 -0700 (PDT)
Received: from octinomon ([212.121.210.249])
        by smtp.gmail.com with ESMTPSA id bd22-20020a05600c1f1600b003c6b822bfe8sm2013850wmb.29.2022.10.10.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 04:35:46 -0700 (PDT)
Date:   Mon, 10 Oct 2022 12:35:44 +0100
From:   Jules Irenge <jbi.octave@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        erazor_de@users.sourceforge.net, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: roccat: Convert snprintf() to sysfs_emit()
        linux-kernel@vger.kernel.org
Message-ID: <Y0QDkCJhR5vcLmDP@octinomon>
References: <Y0HLPBTodPxVRbe4@octinomon>
 <CAO-hwJJebdHvb-JA18XnLAP0LVfvZ6QvOVbskpJ0ZRxPCBmetw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJebdHvb-JA18XnLAP0LVfvZ6QvOVbskpJ0ZRxPCBmetw@mail.gmail.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 10, 2022 at 10:55:24AM +0200, Benjamin Tissoires wrote:

> Would you mind sending a v2 with everything squashed into just one
> patch targeting all of hid-roccat-*?

Thanks for the feedback and yes, already done.

> But please be aware that I can not apply anything 6.2 related right
> now, we are in the merge window of 6.1 and I can not push anything to
> for-next that is 6.2.

Yes, I am aware.
If any missed out or other suggestions, please let me know.

Thanks,
Jules


> > ---
> >  drivers/hid/hid-roccat-kone.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
> > index 76da04801ca9..f0c35c05e702 100644
> > --- a/drivers/hid/hid-roccat-kone.c
> > +++ b/drivers/hid/hid-roccat-kone.c
> > @@ -403,7 +403,7 @@ static ssize_t kone_sysfs_show_actual_profile(struct device *dev,
> >  {
> >         struct kone_device *kone =
> >                         hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_profile);
> > +       return sysfs_emit(buf, "%d\n", kone->actual_profile);
> >  }
> >  static DEVICE_ATTR(actual_profile, 0440, kone_sysfs_show_actual_profile, NULL);
> >
> > @@ -412,7 +412,7 @@ static ssize_t kone_sysfs_show_actual_dpi(struct device *dev,
> >  {
> >         struct kone_device *kone =
> >                         hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_dpi);
> > +       return sysfs_emit(buf, "%d\n", kone->actual_dpi);
> >  }
> >  static DEVICE_ATTR(actual_dpi, 0440, kone_sysfs_show_actual_dpi, NULL);
> >
> > @@ -435,7 +435,7 @@ static ssize_t kone_sysfs_show_weight(struct device *dev,
> >
> >         if (retval)
> >                 return retval;
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", weight);
> > +       return sysfs_emit(buf, "%d\n", weight);
> >  }
> >  static DEVICE_ATTR(weight, 0440, kone_sysfs_show_weight, NULL);
> >
> > @@ -444,7 +444,7 @@ static ssize_t kone_sysfs_show_firmware_version(struct device *dev,
> >  {
> >         struct kone_device *kone =
> >                         hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", kone->firmware_version);
> > +       return sysfs_emit(buf, "%d\n", kone->firmware_version);
> >  }
> >  static DEVICE_ATTR(firmware_version, 0440, kone_sysfs_show_firmware_version,
> >                    NULL);
> > @@ -454,7 +454,7 @@ static ssize_t kone_sysfs_show_tcu(struct device *dev,
> >  {
> >         struct kone_device *kone =
> >                         hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.tcu);
> > +       return sysfs_emit(buf, "%d\n", kone->settings.tcu);
> >  }
> >
> >  static int kone_tcu_command(struct usb_device *usb_dev, int number)
> > @@ -556,7 +556,7 @@ static ssize_t kone_sysfs_show_startup_profile(struct device *dev,
> >  {
> >         struct kone_device *kone =
> >                         hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
> > -       return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.startup_profile);
> > +       return sysfs_emit(buf, "%d\n", kone->settings.startup_profile);
> >  }
> >
> >  static ssize_t kone_sysfs_set_startup_profile(struct device *dev,
> > --
> > 2.37.3
> >
> 
