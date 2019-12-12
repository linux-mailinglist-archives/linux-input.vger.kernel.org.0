Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6E911D767
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbfLLTp6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 14:45:58 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:30833 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730284AbfLLTp6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 14:45:58 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Ykmy0dwcz60;
        Thu, 12 Dec 2019 20:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576179956; bh=jQ54pf6Th0HMTAdiqavUkKS8KHekP4LdV0jt9P6GhmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cJ10Yye52Jy3s5WTedkN4QYJjfdfYtDvYAKQX++zujaW2I/dQukY/cerW+mtAIJez
         Ze5SSQTe9EmVadx2m4iIJYNfxgwxUm1AglT8uK2sTyXJ8nIeRMhG0R9+8jBT8WBdda
         XTIRu3Ri/jdMVjpuC96eEvtdRS1pScGgd93BpAwa7LOroKqjFCrXhRClPHNrYYnoNw
         JfV1OrI5ihkD6xqtxksZJiMwnqHHtd3RxMAEWk7Ep/Ezi8QLLNMiHwsF8q9ckVipWE
         N/QcAAhLbaaXjmpK3iyMJG/8W5zjlka3rU5H+zRYeXhHjTZuOAUkm72uli5HNqy3T+
         QUUEe9em67cvw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Thu, 12 Dec 2019 20:45:52 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Subject: Re: [PATCH v2 2/9] input: elants: support old touch report format
Message-ID: <20191212194552.GA22553@qmqm.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <2b5e15ea600c33dfab4aa50e360ec553f1af7db0.1576079249.git.mirq-linux@rere.qmqm.pl>
 <f53b507c-76dd-8733-9698-952aa7a7301f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f53b507c-76dd-8733-9698-952aa7a7301f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 12, 2019 at 03:54:13AM +0300, Dmitry Osipenko wrote:
> 11.12.2019 19:03, Michał Mirosław пишет:
> > Support ELAN touchpad sensor with older firmware as found on eg. Asus
> > Transformer Pads.
[...]
> > @@ -814,8 +817,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
> >  			pos = &buf[FW_POS_XY + i * 3];
> >  			x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
> >  			y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
> > -			p = buf[FW_POS_PRESSURE + i];
> > -			w = buf[FW_POS_WIDTH + i];
> > +			if (report_len == PACKET_SIZE_OLD) {
> > +				w = buf[FW_POS_WIDTH + i / 2];
> > +				w >>= 4 * (~i & 1);	// little-endian-nibbles
> > +				w |= w << 4;
> > +				w |= !w;
> > +				p = w;
> 
> Did you copy this from the downstream driver as-is? I'm looking at the
> Nexus 7 driver and it does the following for older format:
> 
> u8 size_idx[] = { 35, 35, 36, 36, 37, 37, 38, 38, 39, 39 };
> unsigned int s;
> 
> if (i & 1)
> 	s = buf[size_idx[i]];
> else
> 	s = buf[size_idx[i]] / 16;
> 
> w = s & 0xf;
> p = s * 16;

This is the same thing modulo (w), which is scaled here to declared axis
range (1-255 from 0-15, assuming 0 means "no touch" so it should not occur).

OTOH, I admit, that I don't have any software that can verify those
settings. It might be that eg. one of MT_PRESSURE or MT_TOUCH_MAJOR axes
should be dropped in this case, but with no docs I can't be sure what
the reported values really are.

This is from the original (GPL) code dump labeled 'Asus 10_6_1_27_5':

|  touch_size = ((i & 0x01) ? buf[size_index[i]] : (buf[size_index[i]] >> 4)) & 0x0F;
|  if(touch_size == 0) touch_size = 1;
|  if (touch_size <= 7)
|      touch_size = touch_size << 5;
|  else
|      touch_size = 255;
|    
|    input_report_abs(idev, ABS_MT_TOUCH_MAJOR, touch_size);
|    input_report_abs(idev, ABS_MT_PRESSURE, touch_size);


Best Regards,
Michał Mirosław
