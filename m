Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BE12D6FF5
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 07:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390529AbgLKGD4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 01:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390530AbgLKGDi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 01:03:38 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B070C0613CF;
        Thu, 10 Dec 2020 22:02:58 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w16so6411645pga.9;
        Thu, 10 Dec 2020 22:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=knQp8gVBqPPIkOiuNyIo/e/Y6Chr+LtnuScjkd9ke0M=;
        b=ERVWWq4qj+XDWxJSKLdIcgA201r9kwUKVdsgI9E9epXHoFwouBLeBvCWkBdPJ8wkGr
         9aDkUN1z4ziGQg04Vpe1kOED7YTgcjsJZ+z1rgDyB2KoAsquqcO0J3WHeAP8LrAjOP7j
         dA0BXSW3MkU5Cbc5+F/jOhLdfhN94BrAAjUw5pwQZjjuC0l8g3LqmYgT2forONzhIe3R
         cEmN0VF4wfmnfkbh99+YZ0ZJse5qlQm4cDRHrJyMF/8sTlEOOlJGFSLOKkjUxjVgVJQx
         GCuiWy6sZikRLoZDm0lrQTX4oQbiM7mQpGtomhOc8kooUB6lXvw6pjQO5sYyBIcHoCuU
         cUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=knQp8gVBqPPIkOiuNyIo/e/Y6Chr+LtnuScjkd9ke0M=;
        b=MRQ0asKfyl05Dn+Nk7Ehjj5sa6cUKjQKflPOF725BUnLGy0rMgi69sZIcd0KqfIkAy
         8IEj6pPUGtLHBMyuiBe7jVHrdVIl89fvT/Sx2ii9YV6/R6+x3EIxDhD6IE1xTXz2ztvW
         021of1xBco0Krcqr+1bvbG26tjMxXhKnuxo9hvEsLsWev/oQnhsXSR2Ngha93/iztEnU
         l6BE+ktnHeWFJ7enGrLivVpXilD5bSUOBB73BH73ovohm8QP25K98QWyQRA6gKaaTrq5
         n7wO/kSjGTqb9UoxX9I0zRghf1PR9ZACltXsoZQcSn6Ka7kP0Io56PlV0oIBLUzXtbs5
         mdSA==
X-Gm-Message-State: AOAM531UBQL47K1Tx3zHgdrrMTxUQWQqj1erh4DcZXBv4njNzgPv+RtL
        vdt2oNMW1FCi7ShZUCYnEtHSHPrfHPU=
X-Google-Smtp-Source: ABdhPJyqogWn/DOKto680hL3cFUATlfnVy318gTPsf2gA9M9Wx8LeFiPOwkmyw68POBN4Zyg8oCbUg==
X-Received: by 2002:a62:e818:0:b029:19e:31e6:e639 with SMTP id c24-20020a62e8180000b029019e31e6e639mr10257852pfi.81.1607666577764;
        Thu, 10 Dec 2020 22:02:57 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u124sm9033282pfb.171.2020.12.10.22.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 22:02:56 -0800 (PST)
Date:   Thu, 10 Dec 2020 22:02:53 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     m.felsch@pengutronix.de, andriy.shevchenko@linux.intel.com,
        arnd@arndb.de, robh@kernel.org, ping.bai@nxp.com,
        ronald@innovation.ch, krzk@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] input: keyboard: imx_keypad: add COMPILE_TEST support
Message-ID: <X9MLjclDCIlJZpY9@google.com>
References: <1583137573-16628-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583137573-16628-1-git-send-email-Anson.Huang@nxp.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 02, 2020 at 04:26:13PM +0800, Anson Huang wrote:
> Add COMPILE_TEST support to imx_keypad driver for better compile
> testing coverage.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

-- 
Dmitry
