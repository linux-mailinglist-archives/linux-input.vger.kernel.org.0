Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CE137944F
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 18:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhEJQnJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 12:43:09 -0400
Received: from smtprelay0059.hostedemail.com ([216.40.44.59]:38696 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231420AbhEJQnI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 12:43:08 -0400
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id E9E821802C663;
        Mon, 10 May 2021 16:42:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 9B2CC2448BB;
        Mon, 10 May 2021 16:42:00 +0000 (UTC)
Message-ID: <6a589bf720c5420e09bcc3c40b812bf6822d3a3d.camel@perches.com>
Subject: Re: [PATCH v2] HID: ft260: fix format type warning in
 ft260_word_show()
From:   Joe Perches <joe@perches.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>, lkp@intel.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org
Date:   Mon, 10 May 2021 09:41:57 -0700
In-Reply-To: <20210510163029.2217-1-michael.zaidman@gmail.com>
References: <202105060637.LeEC6ztp-lkp@intel.com>
         <20210510163029.2217-1-michael.zaidman@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.36
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 9B2CC2448BB
X-Stat-Signature: nobrzecesxe1hi9xcwhq3o4h4ii3cyoz
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX195MrQQ61JwLRz6OiWqCCjFadzCwlRMTxM=
X-HE-Tag: 1620664920-830955
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-05-10 at 19:30 +0300, Michael Zaidman wrote:
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> 
> Fix warning reported by static analysis when built with W=1 for arm64 by
> clang version 13.0.0
> 
> > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
>    the argument has type 'int' [-Wformat]
[]
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
[]
> @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret != len && ret >= 0)
>  		return -EIO;
>  
> 
> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
>  }

This is likely a clang defect and not an actual problem.
If you are going to convert one of these, convert both.


