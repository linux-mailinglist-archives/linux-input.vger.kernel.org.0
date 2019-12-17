Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02DA122B7C
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 13:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfLQM2c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 07:28:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7696 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727427AbfLQM2c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 07:28:32 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 40B6AD5FDEDBBC2D8AB4;
        Tue, 17 Dec 2019 20:28:30 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 17 Dec 2019
 20:28:24 +0800
From:   Pan Zhang <zhangpan26@huawei.com>
To:     <zhangpan26@huawei.com>, <hushiyuan@huawei.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH v2] drivers/hid/hid-multitouch.c: fix a possible null pointer access.
Date:   Tue, 17 Dec 2019 20:28:07 +0800
Message-ID: <1576585687-10426-1-git-send-email-zhangpan26@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAO-hwJ+5Ch02fPQ+XF=A4iEcH81V5PrCdV2qGQDZ8HxnQAoEog@mail.gmail.com>
References: <CAO-hwJ+5Ch02fPQ+XF=A4iEcH81V5PrCdV2qGQDZ8HxnQAoEog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 17, 2019 at 18:50 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

>Can you add at the beginning of your commit message:
>From: Pan Zhang <zhangpan26@huawei.com>
>
>This way we have the commit author that matches the signature, which is a requirement for the kernel.

Firstly, thanks for your reviewing very much. I would fix my signature.

>>  drivers/hid/hid-multitouch.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-multitouch.c 
>> b/drivers/hid/hid-multitouch.c index 3cfeb16..368de81 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -1019,7 +1019,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>>                 tool = MT_TOOL_DIAL;
>>         else if (unlikely(!confidence_state)) {
>>                 tool = MT_TOOL_PALM;
>> -               if (!active &&
>> +               if (!active && mt

>Ack on the principle, but this doesn't even compile. You are missing a `&&` at the end of the line.
>
>Can you send a v2 with the comments above? And we will queue the v2 for 5.5 I think.

Sorry about that. I made a stupid mistake. This patch fixed it.

Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
---
 drivers/hid/hid-multitouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3cfeb16..368de81 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1019,7 +1019,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 		tool = MT_TOOL_DIAL;
 	else if (unlikely(!confidence_state)) {
 		tool = MT_TOOL_PALM;
-		if (!active &&
+		if (!active && mt &&
 		    input_mt_is_active(&mt->slots[slotnum])) {
 			/*
 			 * The non-confidence was reported for
-- 
2.7.4

