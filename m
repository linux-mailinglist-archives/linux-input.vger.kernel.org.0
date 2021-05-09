Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39D1377881
	for <lists+linux-input@lfdr.de>; Sun,  9 May 2021 22:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhEIUkh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 16:40:37 -0400
Received: from smtprelay0166.hostedemail.com ([216.40.44.166]:50410 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229840AbhEIUkh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 9 May 2021 16:40:37 -0400
Received: from omf10.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id C72281803EB48;
        Sun,  9 May 2021 20:39:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 716322351F4;
        Sun,  9 May 2021 20:39:31 +0000 (UTC)
Message-ID: <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
From:   Joe Perches <joe@perches.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>, lkp@intel.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org
Date:   Sun, 09 May 2021 13:39:29 -0700
In-Reply-To: <20210509193213.5974-1-michael.zaidman@gmail.com>
References: <202105060637.LeEC6ztp-lkp@intel.com>
         <20210509193213.5974-1-michael.zaidman@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 716322351F4
X-Spam-Status: No, score=-1.39
X-Stat-Signature: ej3kn3hz1a616w4iphgdqbkydg44xq9z
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18+mGqGafvpLnySgOkl4ipBmKaijyWq5nc=
X-HE-Tag: 1620592771-976842
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> 
> Fix warning reported by static analysis when built with W=1 for arm64 by
> clang version 13.0.0
> 
> > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
>    the argument has type 'int' [-Wformat]
>            return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
>                                              ~~~     ^~~~~~~~~~~~~~~~~~~
>                                              %i
>    include/linux/byteorder/generic.h:91:21: note: expanded from
>                                             macro 'le16_to_cpu'
>    #define le16_to_cpu __le16_to_cpu
>                        ^
>    include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
>                                                     macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
>            (__builtin_constant_p((__u16)(x)) ?     \
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/hid/hid-ft260.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 047aa85a7c83..38794a29599c 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret != len && ret >= 0)
>  		return -EIO;
>  
> 
> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
>  }

There are 2 of these so I wonder about the static analysis.
It's probably better to use sysfs_emit as well.
---
 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 7a9ba984a75a..475641682fff 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -783,7 +783,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret != len && ret >= 0)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -795,7 +795,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret != len && ret >= 0)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \

