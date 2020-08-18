Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306BA247CCC
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 05:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgHRD3L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 23:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgHRD3G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 23:29:06 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2169CC061389;
        Mon, 17 Aug 2020 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=JwPtiBa3LyrRoZXU2BzwO65MTUabm9VloNUTo8w7+cU=; b=lFQofNhW3zTGOX4C14H/dZBHyV
        mryjPsMNSrR1J6vP3czQ/Cje9uzH1iFOvnV7eoSIOfTDw+V9bEyE7IqwiB/aJobNkskHFmjVeV2i4
        NroO/q470AnTPvqW735KeCYrXNoYL4Qu+gHQ7Vgw1pJeCBqQyPJuQBMFeZhcriBFEavu2AO5xqT4D
        Nqg4vSeVNp38uD7dJeasKy2Nb8xJojQrJDCNd+OUayIfKq4fbsncVF/InkbZZpHCxSIOeJq9e3VSN
        BGsZwEweMUH2xdBVWQyHGXJuaPeSpMAo9VzBOC+52lwhg7x5tP32MBSg+SC3jzkul8r2yqXU8QUQR
        93Z4LJng==;
Received: from c-73-157-219-8.hsd1.or.comcast.net ([73.157.219.8] helo=[10.0.0.252])
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k7sJ5-0001gU-TS; Tue, 18 Aug 2020 03:29:04 +0000
Subject: Re: [PATCH] HID: google: add google vivaldi HID driver
To:     Sean O'Brien <seobrien@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20200817194937.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b1fcca69-8563-0a85-80e0-a955fe8bca6f@infradead.org>
Date:   Mon, 17 Aug 2020 20:28:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817194937.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/17/20 7:49 PM, Sean O'Brien wrote:
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 05315b434276..5676d4f521c9 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -397,6 +397,15 @@ config HID_GOOGLE_HAMMER
>  	help
>  	Say Y here if you have a Google Hammer device.
>  
> +config HID_GOOGLE_VIVALDI
> +	tristate "Google Vivaldi Keyboard"
> +	depends on HID
> +	help
> +	Say Y here if you want to enable support for Google vivaldi keyboards.

	                                                    Vivaldi
please.

> +
> +	These are keyboards which report physical the order of consumer/action

That's an awkward sentence.  -EPARSE

> +	keys in the top row.
> +

help text lines (those under help) should be indented with one tab + 2 spaces
according to Documentation/process/coding-style.rst.

>  config HID_GT683R
>  	tristate "MSI GT68xR LED support"
>  	depends on LEDS_CLASS && USB_HID


-- 
~Randy

