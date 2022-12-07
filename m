Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D62C645671
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 10:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiLGJ2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Dec 2022 04:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiLGJ2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Dec 2022 04:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B4E23E90
        for <linux-input@vger.kernel.org>; Wed,  7 Dec 2022 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670405270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vnpcakF0D2N+ctDD2M8NYlXoYAPqqKbAo8NR+IyVtOk=;
        b=P+deOssZpXtNnmqDGHy7yk6qHvFy45pirMqyD3WhCkPWL6MJPRvyiZfklCrbBEUeckvNBB
        j2SXx57eAHeUJEN74CWKgVKx1//4GYVDzi9tZqEZGxgImej/6QpoHbznQ+fkh69Obo5J50
        lHxHvKFOxMp4hIU41M0rIi6dCmFahDs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-pom2IHWSPCyOOEDUg0985Q-1; Wed, 07 Dec 2022 04:27:49 -0500
X-MC-Unique: pom2IHWSPCyOOEDUg0985Q-1
Received: by mail-io1-f70.google.com with SMTP id n8-20020a6b4108000000b006de520dc5c9so13359499ioa.19
        for <linux-input@vger.kernel.org>; Wed, 07 Dec 2022 01:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnpcakF0D2N+ctDD2M8NYlXoYAPqqKbAo8NR+IyVtOk=;
        b=fV6A7aqm3TERt3HFcWNmEtvUyLEPwkz2sG0VQOGbqx3K9NRGbeUXEQWBAghtv1PUDe
         /h2drcudlKx7+Fw9VXtjI0EwcYNP9oTynRH/p8prVV4II1XpsnPn+bVySXTItPt1OVQ4
         pYa0Q0CSFHRp7EKl2fIWteHdNApQVE43xbrrNFpNFrj+T+d2fnaKThkfokwpGWwPsc+l
         H4Yv28D6nKGZTPEQWany2/8jkb8j7bLldCN9gmFLSf3CYR41mWd7/szW3QzYmuGtHUXy
         VehE3eMplKirUMLf9AeXAk6el0jEN1vIXku9M2VSE2HUlcezmU5dINX2gZ/CfrmvvJqK
         348w==
X-Gm-Message-State: ANoB5pmyhOQM2xBL7CG/gxSIaIMcAdKaJEUhH29tN8yK/1b8RO1wVNxR
        5cUlfEC3n2SzHtwRXHgDXk9aULlOWj6J5gqlMh1Bj3GJ92eIltXppL6KZi6RRbaGdpAWSENtgqv
        m+NLo0lE4DzmA6DIQUxYErp5RgD0/nQaHtGQ60P4=
X-Received: by 2002:a02:a089:0:b0:375:2a78:73fd with SMTP id g9-20020a02a089000000b003752a7873fdmr40641362jah.217.1670405269228;
        Wed, 07 Dec 2022 01:27:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WxD50Jy8iY8xEumADCWBZxkrPAX9Ius1TK3asOoKktQM+CQvnTZKEtEsVRmuLXZeJp5mWivYYisdFbM4ndyI=
X-Received: by 2002:a02:a089:0:b0:375:2a78:73fd with SMTP id
 g9-20020a02a089000000b003752a7873fdmr40641352jah.217.1670405269012; Wed, 07
 Dec 2022 01:27:49 -0800 (PST)
MIME-Version: 1.0
References: <2262737.ElGaqSPkdT@kreacher> <5647715.DvuYhMxLoT@kreacher> <4809717.31r3eYUQgx@kreacher>
In-Reply-To: <4809717.31r3eYUQgx@kreacher>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Dec 2022 10:27:37 +0100
Message-ID: <CAO-hwJJkWOn3N-UrhjFxiKh7jxPk_BLeL-wj6fnD+mcgHMEHfg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] HID: generic: Add ->match() check to __check_hid_generic()
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>
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

On Wed, Dec 7, 2022 at 10:13 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Some special HID drivers (for example, hid-logitech-hidpp) use ->match()
> callbacks to reject specific devices that otherwise would match the
> driver's device ID list, with the expectation that those devices will
> be handled by some other drivers.  However, this doesn't work if
> hid-generic is expected to bind to the given device, because its
> ->match() callback, hid_generic_match(), rejects all devices that match
> device ID lists of the other HID drivers regardless of what is returned
> by the other drivers' ->match() callbacks.

Thanks Rafael for spotting that corner case in the ->match() processing.

>
> To make it work, amend the function used by hid_generic_match() for
> checking an individual driver, __check_hid_generic(), with a check
> involving the given driver's ->match() callback, so 0 is returned
> when that callback rejects the device in question.

Shouldn't we add that logic to hid_match_device() directly in
hid-core.c instead?
It feels wrong to have a function named "hid_match_device()" and have
to manually call later "->match()" on the driver itself.

Ack on the general idea anyway.

>
> Fixes: 532223c8ac57 ("HID: logitech-hidpp: Enable HID++ for all the Logitech Bluetooth devices")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/hid/hid-generic.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> Index: linux-pm/drivers/hid/hid-generic.c
> ===================================================================
> --- linux-pm.orig/drivers/hid/hid-generic.c
> +++ linux-pm/drivers/hid/hid-generic.c
> @@ -31,7 +31,13 @@ static int __check_hid_generic(struct de
>         if (hdrv == &hid_generic)
>                 return 0;
>
> -       return hid_match_device(hdev, hdrv) != NULL;
> +       if (!hid_match_device(hdev, hdrv))
> +               return 0;
> +
> +       if (hdrv->match)
> +               return hdrv->match(hdev, false);
> +
> +       return 1;
>  }
>
>  static bool hid_generic_match(struct hid_device *hdev,
>
>
>

