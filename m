Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088CE26805C
	for <lists+linux-input@lfdr.de>; Sun, 13 Sep 2020 18:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgIMQ4v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Sep 2020 12:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgIMQ4s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Sep 2020 12:56:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B490C06174A;
        Sun, 13 Sep 2020 09:56:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id v14so2826627pjd.4;
        Sun, 13 Sep 2020 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oABiSeqhfrSrB5GgtUZBeCSmiB7IhFQQoWXbblziWZg=;
        b=Xdsz6TGTcIj0F7b1MF0L6jzdy3owXK60DvxQX5pxBkpZDoIoinIbGWJsFFYVVfI2mK
         CXR15il+et/X7AIRjRtdAqEMu4fHaAyvv40gkdgOQes2buHhdc3nIofAmvTpLUmTCP0H
         5Rh4E8mFWkHKTXc8zQ+PFkpEnywX4VuSHCUPktI6OEM1GeExTt1xhlc6hEfPt+7Ry/S3
         o0mwkrGQLT8LbHtN8jEANBxP/2gKR4N33RInHUTGfOQqaQkVGefdzdYMVbxV1tKTVy8L
         MFSwxgRXfnhGnUiy330dxCP/2a60QICW9zoUktkXW17zi5kyKJOpzJjQTK4Na0MFXyZd
         X3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oABiSeqhfrSrB5GgtUZBeCSmiB7IhFQQoWXbblziWZg=;
        b=k4vj5yOySvnv22UsJ18tIFcQWEaQUm9CPNSffSpa+S/A1ZPktXwjnKhu+j0kehtY0T
         6w9L/rxh0ayejsljwMhrJ4Tz51tes6xRgz2U3PJmcL/IGY6fONDVVy8emmTK6f78rk26
         xs+D2XrIvS5y5SH4aeevQZ76u94MwI9e+nleQmbfl2MBGJ64X/GJ8OhlvaWcPVlMEUtO
         ZMReMBpskjPgKY78ALJc7otrOg7fvMxPw+w3pvZr4RSUF/Xcy3RSsR3v267ndQiT3DIf
         3XwxpmURBwjHCZRRT1TvgWy6cV3pm1Qb/CxNlrFQzcv6gW0MoqEYXWDxjd6xr4no1Yf3
         iLmA==
X-Gm-Message-State: AOAM530r3fYdwz15K7Gbera2ZKbkWWHPCSi6evSikXYFvqtAQfID9tOb
        uV4ddEa1NIbuskQlV09dNYMr0sgS94Y=
X-Google-Smtp-Source: ABdhPJxrDvd59/VSiIJcQ9eZ4FrQiwKmE1QDEStpD0P7fi55GgWDyTrd8GokAl0V5PQ8gTGZnfFkPg==
X-Received: by 2002:a17:902:6b01:: with SMTP id o1mr10547602plk.40.1600016207742;
        Sun, 13 Sep 2020 09:56:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i15sm1330377pfk.145.2020.09.13.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 09:56:46 -0700 (PDT)
Date:   Sun, 13 Sep 2020 09:56:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, digetx@gmail.com,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
Message-ID: <20200913165644.GF1665100@dtor-ws>
References: <20200912005521.26319-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912005521.26319-1-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.

Do we know when the chip is in sleep state? Can we do a quick I2C
transaction in this case instead of adding retry logic to everything? Or
there is another benefit for having such retry logic?

Thanks.

-- 
Dmitry
