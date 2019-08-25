Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B62C9C629
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2019 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfHYU5i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Aug 2019 16:57:38 -0400
Received: from forward103p.mail.yandex.net ([77.88.28.106]:52589 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728730AbfHYU5i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Aug 2019 16:57:38 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Aug 2019 16:57:36 EDT
Received: from mxback4j.mail.yandex.net (mxback4j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10d])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id 25C2018C010C;
        Sun, 25 Aug 2019 23:50:26 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback4j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Ym4u5Q4aFS-oPEC4827;
        Sun, 25 Aug 2019 23:50:26 +0300
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id dS9oAfFzFc-oOL01eRX;
        Sun, 25 Aug 2019 23:50:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom
 usage
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        dmitry.torokhov@gmail.com, wbauer@tmo.at,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
 <cd69abeb3883ff7c7e2ff8dbe4db722f4e981875.camel@suse.de>
 <nycvar.YFH.7.76.1908051437490.5899@cbobk.fhfr.pm>
From:   Heorhi Valakhanovich <valahanovich@tut.by>
Message-ID: <b72a0562-262e-5373-e2a2-5c1b1e5ca37a@tut.by>
Date:   Sun, 25 Aug 2019 23:50:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.1908051437490.5899@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/5/19 3:38 PM, Jiri Kosina wrote:
> On Thu, 1 Aug 2019, Nicolas Saenz Julienne wrote:
> 
>>> Some a4tech mice use the 'GenericDesktop.00b8' usage to inform whether
>>> the previous wheel report was horizontal or vertical. Before
>>> c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
>>> usage was being mapped to 'Relative.Misc'. After the patch it's simply
>>> ignored (usage->type == 0 & usage->code == 0). Which ultimately makes
>>> hid-a4tech ignore the WHEEL/HWHEEL selection event, as it has no
>>> usage->type.
>>>
>>> We shouldn't rely on a mapping for that usage as it's nonstandard and
>>> doesn't really map to an input event. So we bypass the mapping and make
>>> sure the custom event handling properly handles both reports.
>>>
>>> Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
>>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>> ---
>>
>> It would be nice for this patch not to get lost. It fixes issues both repoted
>> on opensuse and fedora.
> 
> Sorry for the delay. I've now queued the patch. Thanks for fixing this,
> 

Any plans to apply this patch on top of 5.2.* and 5.1.* ?
