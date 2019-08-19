Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F12C9204E
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 11:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfHSJ3P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 05:29:15 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:44183 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSJ3P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 05:29:15 -0400
IronPort-SDR: ow+bD0m8ueDFrJR7h02J/muCMdawzSnYuDVmTTRyzkuqLOHzSOynxc1PupWASWhVOlI+bQ3/WY
 abSTTOywoaXVVLd+legcWdrroRniXLE7CGFjhbah5JqP/9H2CeH+Z/pqRpiYcTyxrJhjlA8OGW
 tOha384j6vVRpq2sTk06vDYAI9XCZzgxkjUW0ElGwJ7EHsmq8PfzAvVsInqtwz2H6nfNnbe8GW
 5sVDb5l8xOZn6FpKnk8oJek9zCTvtkYZPpmr8FZDdEz4r0i81pOWI1SPUGVWmpYzv4oJd7pPsu
 qDI=
X-IronPort-AV: E=Sophos;i="5.64,403,1559548800"; 
   d="scan'208";a="42360493"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Aug 2019 01:29:15 -0800
IronPort-SDR: IT9GoyRFK3wHhc/DTzg3Rp8NgXyrHhbTkzDe8yKWboSLYDaNxoWtqSkBEEHJ9J9zICQMAmn641
 zsgQ8ICI6M43abzYu1VH5kQG/+FhX50AVQ1/lWpuepNJP4kXqNQQzmfRpx/AcVSYXTkbez2I/E
 ukHZ6vLqSKfFshHrnvqnhMo8hWyDz/oQV5YEyv3g3iuI/eK/F2nWgZaEFp3PkC5FK/piATzflU
 dqQQF5GLxnWNZueJlgmgV7uwsLAjYTBeTvnKlE41XFdrsItY1imPP9Y26sX2h8QxGu1fYK35hB
 w6M=
Subject: Re: [PATCH v1 00/63] atmel_mxt_ts misc
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816173209.GL121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <1d6498a5-4049-d929-99d8-1177ffea135a@mentor.com>
Date:   Mon, 19 Aug 2019 18:29:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816173209.GL121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

  HiDmitrij

On 2019/08/17 2:32, Dmitry Torokhov wrote:
> Hi Jiada,
> 
> On Fri, Aug 16, 2019 at 05:28:49PM +0900, Jiada Wang wrote:
>> This patch-set forward ports Nick Dyer's work in ndyer/linux github repository
>> as long as some other features and fixes
> 
> I see a lot of chages that are fixups for older changes in your series.
> They need to be identified and squashed together, as we do not need to
> be aware of your development history.
> 

Thanks for your comments,
in v1, I already squashed several of our internal changes,
but seems there are still some can be squashed,
I will try to squash all possible changes in v2 patch-set

Thanks,
Jiada
> Thanks.
> 
