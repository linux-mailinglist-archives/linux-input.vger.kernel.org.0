Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67717792E2
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 20:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfG2SOz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 14:14:55 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44781 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfG2SOz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 14:14:55 -0400
Received: from [192.168.1.110] ([77.4.29.213]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MY5s5-1ht0bI3BML-00YQTu; Mon, 29 Jul 2019 20:14:53 +0200
Subject: Re: [PATCH 1/2] input: keyboard: gpio_keys_polled: use gpio lookup
 table
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <1564415994-22871-1-git-send-email-info@metux.net>
 <20190729172607.GB755@penguin>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <b2912c1d-a6d8-ad2a-3e37-19e4d3d1bd3b@metux.net>
Date:   Mon, 29 Jul 2019 20:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190729172607.GB755@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:niAflXSiIAGvJeBkeW6ZBFwWCpUhgdJKNJaXl4oxp6SZGttm57Q
 KIRHkU7RAxE8TGcFK8192TZRKpf4e7namaJ8/lUqRryKBq1UTwE2bPm8B4fdDV9t9rDSgGp
 wQ7zzxmO5r6NybnZaf4n5NdoTIFmh+fwsq8hx4puN7urem22qsR9Ij9QUbdyN/EkIQ4KHXF
 11gRyyIOxTt25IiekRmRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F7gHLO2/IiY=://7flOcwe6m3nOYtiFi9kB
 CVKOunpf8rjPS34R+NviVt70P5yOP6JeiGmgd6zm7QFy5Cu1cqYCJbRabTOR9F7wcQHTEDhoI
 niwTFZQ6YQ9SgawjBOT723CeKTCpL1VO+vvCMBlCpOJB5iCSi3/dKwWeAIsOMlBgUZ5KqEuHd
 QJ1QmxQNCOFgx0Qpc8aRkQMD0t+VFmAKsDgZ65py85SJY5puAGxuUfAIW1BcjiUrz1GghBp23
 s12OF6VdvSFDsWWvqAi80q5k8TZ9y3AbU0F5/t0antSmzaygxYJaZluxD86txyQd7474Yv01i
 uYO9M5X4GdipJ1nYQtFzUBNXXedCpFlwFNh9NA2Dd6CY9tcar4m4fs2eqAtrGQid5jbXUqwrw
 qLxm3iPSqnvz03zTl6V04s0+GpZ8X7+sxKSXrtYDhMwoY036t5/p7FNNKgxuvdXzDtZwTCjWe
 TFS/jf1zx45Sot1oPGYru8jlWhIPYOyHZdmKS2X2j/g2Qj6kMDg7r6NSdemqoKWEQoLCAZykd
 FkkrCCoBWvY9tzOe+YoSBEGr6g1xFglEiRMWfb/h1HEdSGwVF/Mq43+rjznH7PlQTJISF7EpR
 L4dw4R3ExcDjBuC/ftvOLKv2hEOIgm0wjKQb+rDVBdT4F2E0aM90SeoYDRATOVB/izDnilk/a
 ujTkatbafbKKznS4R8ofuIyDPW4UwbImdzoEhp0RhAInur9nEYSAFIwS6wgIkbEaJqQEnUQvY
 l+lqiUZcfTj4kHiUTOtKfCly+0AYXwzNdpGoLbkU+etgVBw5OilgP2uSbSQ=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29.07.19 19:26, Dmitry Torokhov wrote:

Hi,

> As I think I mentioned a while back I would prefer to get gpiolob > support swnode-backed properties so that the driver would not need 
to> know about differences between ACPI, DT and static board files.
Indeed would be nice. But I think we should get rid of raw gpio IDs in
favour of gpiod lookup tables first.

> I just recently re-posted patches for this, let's see if we can get them > landed in the kernel.
Can you give me a pointer ?


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
