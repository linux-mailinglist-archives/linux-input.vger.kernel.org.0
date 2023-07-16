Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BEB75507A
	for <lists+linux-input@lfdr.de>; Sun, 16 Jul 2023 20:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjGPSja (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jul 2023 14:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGPSj3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jul 2023 14:39:29 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF66E1B5
        for <linux-input@vger.kernel.org>; Sun, 16 Jul 2023 11:39:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e99584a82so4911446a12.1
        for <linux-input@vger.kernel.org>; Sun, 16 Jul 2023 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689532767; x=1692124767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HYXnA9/S/l0W40c9PuJgfTW0gfrS1Cr5dI7gZsJAL4=;
        b=ValUvzS+2cWVIILD1r+8UeRpYZ8QjjO085E5o+uRhnEjBqQ2bt/1wFu/vovXUv2o7V
         A9Xya+05e3o+BvifZQXpPlO5lZeMcNwEJ/xjTNnXALXpCRDUjZEqc4JnSBYWuwtnhbpy
         2Hu5ZKo76NsSWWG7r7HVUv9hJaX6uDs+ZWguI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689532767; x=1692124767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HYXnA9/S/l0W40c9PuJgfTW0gfrS1Cr5dI7gZsJAL4=;
        b=Eihf5hPaZCH4lD2+HJ3+Ycy2+k65cWASaCrWdy5vKMWk/Qgdcm6B0Vh+HjPbOR2zWY
         QNG7Twd1uRbkiyUVlDljtO0ADVAKuQDw4Ctt6/kw7LbqVjtugdWOl7FDaPQiJ27UdSyO
         CIZsHnt6+KF81jzybHrLvOKaiRPiDzGEQRy7Ls7nzgP1VO2fhBvmg+dtTfI76bRm3BXn
         v/TXVM5RwrbdF/IegoIYR5t8gPyTY6a/Qg7jqToLrd+z5YomjAhnsMSSn2SEEAN9kse3
         UDLsvzzC/05qMPRa4XMdtqOwo8f3AGTB2SLEUdDcnSlXhkg0le0kGgP8F1slkHTlcJ51
         UjNA==
X-Gm-Message-State: ABy/qLZKIWmN7aCA/3KkqWQngFVOgIOLjv+4l0RtCL5/V/FlhQAdDZvQ
        8Lhs1GKIccj/Hq2v4chUfrpYQg==
X-Google-Smtp-Source: APBJJlFgAO6Ll6zSlQL5y78I0Z0BYy4FDVsKnLPAz6tjqGRjXtsal6lAdhWGAeXKhPSKpg/mwzthCA==
X-Received: by 2002:a05:6402:12d9:b0:51d:94d2:ffd2 with SMTP id k25-20020a05640212d900b0051d94d2ffd2mr11368613edx.2.1689532766850;
        Sun, 16 Jul 2023 11:39:26 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c447000000b0051e22660835sm8794749edr.46.2023.07.16.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 11:39:26 -0700 (PDT)
Date:   Sun, 16 Jul 2023 18:39:24 +0000
From:   Fabio Baltieri <fabiobaltieri@chromium.org>
To:     Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-google-stadiaff: add support for Stadia
 force feedback
Message-ID: <ZLQ5XMobES0r6Fel@google.com>
References: <20230709214410.3676224-1-fabiobaltieri@chromium.org>
 <878rbidwn5.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rbidwn5.fsf@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rahul,

On Fri, Jul 14, 2023 at 02:13:34PM -0700, Rahul Rameshbabu wrote:
> On Sun, 09 Jul, 2023 21:44:10 +0000 Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
> > Add a hid-stadiaff module to support rumble based force feedback on the
> > Google Stadia controller. This works using the HID output endpoint
> > exposed on both the USB and BLE interface.
> >
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> > +static int stadia_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > +{
> > +	int ret;
> > +
> > +	ret = hid_parse(hdev);
> > +	if (ret) {
> > +		hid_err(hdev, "parse failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
> > +	if (ret) {
> > +		hid_err(hdev, "hw start failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = stadiaff_init(hdev);
> > +	if (ret) {
> > +		dev_err(&hdev->dev, "force feedback init failed\n");
> 
> Error handling looks good to me now. Is there any particular reason you
> use dev_err here instead of hid_err here?

Not really, copied from another hid driver and did not realize the
inconsistency. I'll fix that up and send a v4.

Thanks again for spotting this!

Fabio
