Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142DC6FAD5
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfGVIAj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 04:00:39 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38443 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfGVIAj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 04:00:39 -0400
Received: from [192.168.1.110] ([77.2.59.209]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5lvf-1iVaVn2qDL-017DXl; Mon, 22 Jul 2019 10:00:16 +0200
Subject: Re: [PATCH v3 2/2] Input: soc_button_array - Add support for newer
 surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-3-luzmaximilian@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <a2f75544-54ce-abce-56a4-ca226dbed51f@metux.net>
Date:   Mon, 22 Jul 2019 10:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190720150511.95076-3-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kCelReQIxIaGbHBVJ+RjOKPzo90HvOdqUfwPCr9J7kyb+0H0zir
 wwhPJhb9A/DanLN7FxvNGLqMO3VOdz/75c1AHYlaoAA2W5FV4FhGM1tUYzmWHQKx8mbRhKK
 O9ZtfWE1Nxa7jiqO3Ct07LdETKKH9vZ3Sf3oT/kamDFNZKZZlcrUxmR4CfmFWG7lkPn+wwn
 cj63RDkiVRc42A4ICYm+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qwUQon797ZE=:CkWkEhX8ZpeCMjv9levot/
 4W6wL01V8iJ7uKkXMABG42/hMZn+al1R1yw1nkYlCyUteMsrLOtE7sPT9yrIZiFnV6KOOgJXW
 eHEpjrCsxpMyCODHotFI7fd/NWtXUPMZQU9aySxInhov+TxP3FBwEDcrrUnUC8c1Z6D1B3Q9g
 icGav6cf3E4hwFpGgEv/9dAT8/W7Edyvh/Qk8AXK3BQb7YkkL3iIrBWGFmnQMo8sq8+Obnhau
 wWlfmy1EfbkXg9EVV/Kbq0xfi0Grmft7Crk5kFxlXghFvTbTZjPOCz7iQPGkX6av8zZL008qa
 iQKfVdf9NTIg4aZPmfqNY0Rt0ofKKTkjuLe8cBrjmWRGdSMOExzEOr6+l+KeNnMRvHLm1HX1t
 O/6OIv3vh3tV/3x3P0II5maODJu20WKa6AU9hkfKYNMj6cxlsi4StR2hJ0+SzHfrXc34T6t10
 rY6W4EP/81DThWfkvp0FFQwwezSjyoOTLdnmlKkeBtHSGHEGAn2ifEAMOJS7p+D2qUVGHH6VU
 c8x3oY/b+MQj4HsmgrUoTi8lZeYtltJHxfBnphAGzjR3m0WDRrz/DUBInUFz/RZbbH42DnGfp
 03x1RPyHH/SV8FA+UIim44hb86HSlchXabnBuN9FTzvtg/IRAQS0AtX3BovFlDvH4fbKnvmza
 z/8xIbaTdlW2pbfOXeEDsRLXgSvtXFwCCf8QrjYoPJS8U9UcOZ0jsTIAofquTd+YI8wgq71dw
 t8bmUf/T4hcvUPbmv+BNldLyOnfqlwwMveECm57Syhr5tjlXszJUKzMMC8w=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20.07.19 17:05, Maximilian Luz wrote:
> Power and volume button support for 5th and 6th generation Microsoft
> Surface devices via soc_button_array.
> 
> Note that these devices use the same MSHW0040 device as on the Surface
> Pro 4, however the implementation is different (GPIOs vs. ACPI
> notifications). Thus some checking is required to ensure we only load
> this driver on the correct devices.

Could this also used on the older (pre pro4) devices (also using the
gpios directly, and leave off acpi notifications) ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
