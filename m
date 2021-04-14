Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B3435EC45
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 07:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbhDNFom (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 01:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhDNFom (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 01:44:42 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D5EC061574;
        Tue, 13 Apr 2021 22:44:11 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so2460224pjb.1;
        Tue, 13 Apr 2021 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0yUWu7HT1CFubm9J9J6q0kW33Nxa/Vxt5+k9PPHbEws=;
        b=taov2KT3L1c1f57u1+idS0honSH9d5nm2ajmI/KBa40GjvBtUJYuErDXVyirg63xxH
         d2zN6EhW03EaWfa8xH+7qSCso4TtDma+si8kGuBlqgYMeC9wwibKZBa49eqmhEd3+fXt
         u8+txaEJVZ1+NAzbUTA9Ry/nEL8yAUiJPhY8v1B/7Xs8M+KVO8y0FHZzuwgNETlsh3rV
         j2pRG0cNWPb6uZ9RcRhlxBegvYFTriBEyOTn3Ry0BYh/SfUtiE4AdnXuhXWg3fZdP7IX
         Db6OXgaHUVncqEsZHhkAftpbb66VAeWK5wo6jFZCnFEkhB26iNgSnX8YWjERU8MDpucF
         CnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0yUWu7HT1CFubm9J9J6q0kW33Nxa/Vxt5+k9PPHbEws=;
        b=Oqw+gnaYcmzqR724eFqs75jYjD+RkdnUDqh+QvC5LUnfIKnmYECuRCQfTpzjG57o/p
         0+ol//t15IjxS5lZUB9n9l/PWgE5nENj7fPm4Ml4x8tGoJET52Y7c5sTkoLJ1QlndeZ5
         UDIJIalv+DiiY5AJb9fz6KMq/qX8yH4R+WwH1sB6wOgtE3xfJoNqa2RkiZ/4eL/K0du8
         dYPZ/UZ8sYxdArrXIDniKXMLFJZ7tV+KXxI+TlyWtb7JwsBS+LUNCj0XZdZuruujs3lW
         2A0omle5COVLEVGkF8ED74DWDaKgUFlXQQbpIyhDlWydmWuhvQZ3ApiwBQZoc+UZ9YHo
         sU/w==
X-Gm-Message-State: AOAM5331D5fRazvnVf2KL041Guvp32VZ73Afm4Mob/hka4a8GSMGOdRE
        +hqg5hf7QS2WGDyI9kFdBE4=
X-Google-Smtp-Source: ABdhPJxe01iw9hMUytKwMjDjm2FruOBj5fo5ljz2JrhYbGlLVBdQUY5kUyI+6gkArdn/pSDaRl3QLQ==
X-Received: by 2002:a17:902:8601:b029:e6:7b87:8add with SMTP id f1-20020a1709028601b02900e67b878addmr36146232plo.3.1618379051313;
        Tue, 13 Apr 2021 22:44:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c22:82af:e208:38f6])
        by smtp.gmail.com with ESMTPSA id q14sm16902014pgt.54.2021.04.13.22.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 22:44:09 -0700 (PDT)
Date:   Tue, 13 Apr 2021 22:44:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
Message-ID: <YHaBJ6MX9c28MUQY@google.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Giulio,

On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
> +
> +	input_mt_report_pointer_emulation(tsdata->input, true);

For touchscreens it does not make much sense to report BTN_DOUBLETAP,
BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
this to

	input_mt_report_pointer_emulation(tsdata->input, false);

to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.

Thanks.

-- 
Dmitry
