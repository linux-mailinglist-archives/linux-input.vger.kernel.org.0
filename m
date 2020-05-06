Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126921C706F
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 14:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEFMiA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 08:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727874AbgEFMh7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 08:37:59 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694BFC061A41
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 05:37:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t11so1197096lfe.4
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vIN5MKPLeNGbWiYHgtJvnfkqaDr6sG1XDxpbHqc8lM=;
        b=kaEO8qV6PIFjtYwjIDIahnc/RQhVLTmcERmgJGOXglVl98mzoWY2lV+n22uUQ3sTU9
         oCcsrORlY/Y6EPw6AOdxdX5hS9ObK6ICW5Zc2X4VzbEsQvt+d3sAd06d4Xt9vP8o7oEg
         if+HkIsWMBp4gg383s9tXCLbndzR5RzR9/v/XEau0KqBATsQeodpC6OyXd2Fy7ZXdai/
         nY7FWkCB9mFTaKZX4MnTXzjyO++yl6X/9Rf4f69mnXz+wf1X5QyL27JvrRjNYJ5ZZVc3
         JOS/p3dYNhGBT6XWiogysHwo3eovKnA1xBe9i2RMBn6oMTaCUS3UByCH4WZIkA3jIhyt
         8fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vIN5MKPLeNGbWiYHgtJvnfkqaDr6sG1XDxpbHqc8lM=;
        b=qYlaodH4dELk7kIgLRSCpW1KD0/z/PiSHTF9Nl/XoVgaMFbw0Iy1AuwcwBLAIrCCl5
         ZYJ0J33DslozEG6f5KAPQCQs4Sw8VIU9/LdqarL+P5BWCUl/NP08iGJETYR0J8oE0PoY
         I8bJDChbYgaqJGkFPaoHp0/W+YioxL/9TB/kcoH6B29L5LIfoRG8dAtGq21O8K3Qf6E5
         eqNwF22xDpDFNprqrzRTBcqRIL/qIMgmUvd5u79fXW5atTFH1MZjBJATI9qprSkEqyA/
         9UN565dkrs7MiBu7OBLNDRgBZQantpjXtRF8LObOuzrLwZ74sW8IeBjmiYwb/8KF1Im6
         Kmzw==
X-Gm-Message-State: AGi0PuYi/J0mJF9jzdQ+2E04eDLiA/z5OGTo/jj/RCr0RfXQUt31nB+P
        BKEe7lkiGJWejsTIt1pNaKYk9k7T3/8aFv/qtJQiLA==
X-Google-Smtp-Source: APiQypIscBufxrzX8o55c1IMYLoTuOUYZIw8WZNx/RqZ9X8rS3BVqal75ivPG1WUGd3PnEmeKRrga5Mx5j8aXZYQyZ4=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr4967725lfi.47.1588768677564;
 Wed, 06 May 2020 05:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200503172206.13782-1-xc-racer2@live.ca> <BN6PR04MB0660ABCDFF774833264D39A6A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660ABCDFF774833264D39A6A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 May 2020 14:37:45 +0200
Message-ID: <CACRpkdanfaPRwm6vCGTDStxvZj38k8OTL5BviTmyTJcx0KtARQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: accel: bma180: Prepare for different reset values
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 3, 2020 at 7:22 PM Jonathan Bakker <xc-racer2@live.ca> wrote:

> Some variants of the bma180 (eg bma023) have different reset
> values.  In preparation for adding support for them, factor
> out the reset value into the chip specific data.
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
