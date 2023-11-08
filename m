Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920437E5F55
	for <lists+linux-input@lfdr.de>; Wed,  8 Nov 2023 21:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjKHUmL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Nov 2023 15:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjKHUmK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Nov 2023 15:42:10 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D932126
        for <linux-input@vger.kernel.org>; Wed,  8 Nov 2023 12:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699476103; x=1700080903; i=jsbc@gmx.de;
        bh=Hi7h1GDsKPoU4lNhSifjgIq5gOMvGD8N0C+BOwYdmlo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=dUgiGGM6PJc0X41PmL9Yj6jSvdk85W38XCMxGD+k/d3EmmfS+bUJLPbMSlv/yLOv
         JJ8fLF1jqYGBH5cEn87jln3u3cOzoodiAlVF2Gzrizps7cGTn2FWvhBhfCdVBRK/W
         CUedu/TViKr8p5RRARZ/g3PuOYUxbQjBtU5R9+CnUg9H8Ss/wCoIGyHdusZ368oGP
         F21E30qZqah3COLn7m70Tr/KKe2rBPwDAry4tpGFb7zuzUVyM/nMKWivB+xta313A
         nOO5KP9JmKfbmQCIt2eLBsrxXVD7063h+monpcoJhM16DDLwBk0oV/KrYYDy6zz3W
         wloH38D2LXdmm7qd3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.3.6.184] ([79.214.253.248]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1r5lJp2In0-006A25; Wed, 08
 Nov 2023 21:41:43 +0100
Message-ID: <94818595-be2d-4cba-bd82-1585b8d11fed@gmx.de>
Date:   Wed, 8 Nov 2023 21:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] HID: i2c-hid: Rework wait for reset to match Windows
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
References: <20231104111743.14668-1-hdegoede@redhat.com>
From:   Julian Sax <jsbc@gmx.de>
In-Reply-To: <20231104111743.14668-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aIMvu6eT540nCHAMTUlOlpV1JXJIh03QASAkC4a4ZzZXTRWNUM8
 OHn7/v+jxjCv/Y7eOErez0MCd2AXbe9znSiuEj1Vc5YcLnmMJrwTJBLvn3jFjOHvdE7bWU7
 6aUWu5CQg9mHZHhiI6xRdAf9KKRhLLlrPs4m53c4n9KJ45GTfMGahctkNke6vFlCpsBZFHZ
 CK9G0DjXD9wjCmW9u5biQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MuRNo9p13w4=;bVjiPxAVQG7N1tKm6NTVtD0c7lL
 LdsbyRkH7LZv/itugkAwzYgXQfyZPmuLVWr7DTcSK7C4ECTraFaqsjimkaJZL10Pm4BR5aW56
 d5zE01fYBCUZyeYEuAdnPKTNu5XLF5Afi5sDZgCD7Vp5/PsllKGsKz+MMRCf38uYGrL7b9/JM
 OTOHdA5Cf+cNGVJZsGR2AuiQrgAlUuAZFPeNDhVhaLe5nWB859KNRrTChnJuDt3d9CpscO7Nb
 j6a7wKDtFrCuLaQxV4aTJ/8FLC4hj5Nq3LfW9zKPUnqhet+nfNy+3Kfv2vTRrTLGc5Xns00RO
 FAYmYocRg6Dbs+Fm5Qj+7z8XxC7HZdTYIM84LNZ9n8nB8UAyFnk88OdLt+u/r+JycNN5Hw9vk
 3Z7IYZfvoVPRGKVnh2o94wGCMEmQQSzKSMBCQrQtslZiFoKcbNUHK1cgA3IaEkuOtWqSmCH0i
 8zyyxR+hdmWlxqMQSiCuCYXHlqK+dp6jBxYGln/S21kmNGE5lfkIYLtcp+S+dc/Lg7j6KZ18d
 GEj801LP9doA/XRUpxS2yLILeHRmKOPckIYZAsHRMG58iH6vl6AkXZCcHxlGi9T1Y7viUbcrv
 Cy10qE1FOBQyluRZj03os+sCyY8R2g8ejMykNm4xJs/zgrOAohAznUySINaUYidnSU00mYf2F
 gTqvKQL+2seLM4OnF9IP3VlFR5RQ8rs8n622isicxQoIGY9CuPMistrb5BuMr5Np3wQR5tzQX
 2LObwUccfqkrLul5WPPhnXy1vA0IF3NRypMzT9VsDT62drMY4EXdLZBy1pjnxpP5QAIcrt4lI
 EZI1ZputQuAwmS8AT3wOPe4jvpp/H5dSiiLPQ9dQRHmEkKg/whyd2qq7VUKLO7m6dFD055r7+
 Zy/tfe78JNpcrmNAPiALOpfZ7QHKkA4oLzz7w3+/3npjPw/Sh5k6JYkUcGDL8IagWE1Yei9Xe
 bHGYytLDnwcL70pdsNHLfRGY9jw=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Am 04.11.23 um 12:17 schrieb Hans de Goede:
> Julian, I've added you to the Cc because you developed the code
> for touchpads where the HID report descriptors are missing and are
> provided by the kernel through a DMI quirk. The behavior for these
> touchpads should be unchanged, but if you can test on a laptop
> with such a touchpad that would be great.
>

Hi Hans,

I just tested the touchpad with these patches, everything still works fine.


Regards,

Julian

