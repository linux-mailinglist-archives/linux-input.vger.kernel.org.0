Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE514455FD
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 16:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhKDPGZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 11:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhKDPGY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 11:06:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BC2C06127A;
        Thu,  4 Nov 2021 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=qwvXqK9WfpABlnYLs1rz4OW/XX0gy0Uke4TaHG9ErAQ=; b=QMhaydoA8wa3AMFKH7QOCRC+bX
        rmAI1iGz0bvAWpEpXbo/BpwSRs3rylndY+kuB0KIpxe0Oow2cKvi8xLfWi2QlCaKFBvsCG7rWVYT+
        OssYjZeXdwk3lA2o8z54FrdJqUB1YbDIzEMLo+kEaBzVtcYZjLCv0x/SNY2A25LSgI7TBhnNd2TYm
        c/lK/KOR1Y4sNGMJxzlyLJXK403kbHlb1O/ZmqARBVzjbTnJZqd9bsQJevaBRrG8tbkmGHGGnKySu
        ARa/DTNSzjN9Z6BQWmWA++gqHFFoxSxVmQcT5A5C25JxmcWjvLRWRXFGJHaTxawon48V/S66EbgKt
        s4cUrhKQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mieHK-009C76-B4; Thu, 04 Nov 2021 15:03:46 +0000
Subject: Re: [RFC 6/8] HID: usi: Add driver for Universal Stylus Interface
 (USI)
To:     Tero Kristo <tero.kristo@linux.intel.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, mika.westerberg@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
 <20211104133701.1733551-7-tero.kristo@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <07757860-06bd-b47a-51ff-24cf31a7b28b@infradead.org>
Date:   Thu, 4 Nov 2021 08:03:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104133701.1733551-7-tero.kristo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/4/21 6:36 AM, Tero Kristo wrote:
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 3c33bf572d6d..c235ecb8f037 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1222,6 +1222,11 @@ config HID_MCP2221
>   	To compile this driver as a module, choose M here: the module
>   	will be called hid-mcp2221.ko.
>   
> +config HID_USI
> +	tristate "USI (Universal Stylus Interface) support"
> +	help
> +	Provides USI support over I2C HID interface.

Indent help text "Provides ..." with 2 additional spaces, please,
per coding-style.rst.

-- 
~Randy
