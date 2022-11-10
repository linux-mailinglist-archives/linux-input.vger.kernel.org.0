Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86D0623E7F
	for <lists+linux-input@lfdr.de>; Thu, 10 Nov 2022 10:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKJJX7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Nov 2022 04:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKJJX5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Nov 2022 04:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675866A6AE
        for <linux-input@vger.kernel.org>; Thu, 10 Nov 2022 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668072182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YX8VazdZMuqZXYpMnkdqn7btKqnT2/oiOnOG0HPFf+w=;
        b=D9gzsdSUilHc7hNyXul+C92VqwIO71C5krHOUNqaXmb98k0eny6PcBaNfb5zQXztbEVbIu
        Ot0vl2jgeQujmaC+Ck2SnbhJ/lHKi8CJsoGguJ825F4g/mKWG9x54Zkcak2nVGA9CqDs90
        /sl9TRVoENMAzzx3MEJPALNlAFJc0pg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-X1BuY_O7PwW7Q3ySqtGrgg-1; Thu, 10 Nov 2022 04:23:00 -0500
X-MC-Unique: X1BuY_O7PwW7Q3ySqtGrgg-1
Received: by mail-pf1-f197.google.com with SMTP id z19-20020a056a001d9300b0056df4b6f421so787409pfw.4
        for <linux-input@vger.kernel.org>; Thu, 10 Nov 2022 01:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX8VazdZMuqZXYpMnkdqn7btKqnT2/oiOnOG0HPFf+w=;
        b=c+kDGghbjUFqyBl7gXFH/olmsQXErZMQ5uU9csnH3JpGwr6yhYys1mm0MCv0cwyFDA
         F9mpBkQRMTMk+RI0Djeu+Ec64iFJJkmZSjfbsjq9P+WggNeX5qgv/CZH/PDPyurZVHMO
         Sgp492QA4UVK2WIN5qJXryi6u6OI8aA/L0KA+OVIyVGsGzOxO0+XuZL5+f/pox1WwbJG
         AgYiYEWQbKfD8VkQJz25S0fMQfJhNMktD591/yo+T6tla6H4rjlROtGNaGS+2I/KIWCA
         Rh9OXpybBZQPtbpOC5h/OjwwVo1jWLZ6Ls/kliKgepGOezTyxZJB8Yg8yjSogQDKLzl+
         UIJw==
X-Gm-Message-State: ACrzQf0+up07A8N5JTB2OGLIPa9BvoY5QFDMI00exxsOmFM67WE+d7p9
        6vH6bCavh+3Cixb0hAE9VCoF4iIPjqVr+xpH1uLgBlJmldXYkJQIbOX8LQA3Qo5UOB7P+OvYuJC
        G76e1ZFQhuM9AETOJPqdl6tlv2Z1CWKh3A56KVgI=
X-Received: by 2002:a05:6a00:18a1:b0:56c:411f:b699 with SMTP id x33-20020a056a0018a100b0056c411fb699mr2196443pfh.48.1668072179842;
        Thu, 10 Nov 2022 01:22:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4KIbM4VvR/7LBUPVhwAai8DfJ25QJwPeo5ONkjBoS1/2YMcYTA7TPGpDiUkLFcCBrXfD11HSisIX7/iTURTLc=
X-Received: by 2002:a05:6a00:18a1:b0:56c:411f:b699 with SMTP id
 x33-20020a056a0018a100b0056c411fb699mr2196432pfh.48.1668072179550; Thu, 10
 Nov 2022 01:22:59 -0800 (PST)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
 <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
 <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com> <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com>
In-Reply-To: <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 10 Nov 2022 10:22:45 +0100
Message-ID: <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 10, 2022 at 4:29 AM Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> On Wed, 9 Nov 2022 at 21:27, Andreas Bergmeier <abergmeier@gmx.net> wrote:
> >
> > Finally I have an environment where I can test my kernel code.
> >
> > On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > > For identifying the GLOW device you should be adding an id in the
> > > table of hid-logitech-hidpp, with a driver data that tells the driver
> > > to look for 0x1990.
> > >
> > > >
> > > > > - you need to add a hook in connect_event to register the led class
> > > > > device that will hook on to the actual LED of the device
> > Sadly my tests did not go very far. The code fails already when
> > calling the `probe` callback (`hidpp_probe`).
> > When it calls into `hidpp_root_get_protocol_version` it seems to
> > receive `HIDPP_ERROR_RESOURCE_ERROR`.
> > Which then leads to an error message: Device not connected
> > Upon looking at `HIDPP_ERROR_RESOURCE_ERROR` (9) there is no
> > documentation what it means in code.
> > From a look into the docs it says that 9 is UNSUPPORTED error for 2.0
> > devices. Thus I am wondering how the code knows
> > that it is a problem with connectivity.

From the top of my memory, this was told to us that this is the way we
detect if the device was connected or not in the unifying case. Though
in your case, it's a USB device, so there is no such thing as "not
connected"...

> > Couldn't it also mean that the
> > device is not supporting getting the protocol version?

Probably. What happens if you comment out that protocol version
request and force connected to be true?

> > And why is protocol version only enforced for non unifying devices?

Unifying devices are wireless, and when we probe the device, we are
actually talking to the receiver. So The device might not be
connected, and we should wait for the device to be present and not
reject it. On non unifying devices, if the device is not connected,
this likely means that the device is not behaving properly, and so we
can not handle it in the driver.

In your case though, it would be interesting to know if we should
bypass that verification.

> Also, looking into `supported_reports` turned out to be 2 (very long).

Oops, you mistook the bit definition with the value:
#define HIDPP_REPORT_SHORT_SUPPORTED  BIT(0)  -> value of 1
#define HIDPP_REPORT_LONG_SUPPORTED  BIT(1)  -> value of 2
#define HIDPP_REPORT_VERY_LONG_SUPPORTED  BIT(2)  -> value of 4

Which is coherent with what your device exports: only one report ID of
value 0x11, HIDPP_REPORT_LONG.

> Inside of `hidpp_root_get_protocol_version` it does upgrade SHORT to
> LONG if the former is not supported.

Yep, this should be good for your device.

> On a whim I then added upgrade of LONG to VERY LONG if the former is
> not supported. Sadly, the results stayed the same.
>

And this is expected because you don't have VERY_LONG support on your device.

Cheers,
Benjamin

