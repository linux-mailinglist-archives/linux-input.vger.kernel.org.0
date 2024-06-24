Return-Path: <linux-input+bounces-4605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB891572E
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 21:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADBA6280D8B
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 19:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E55719FA9B;
	Mon, 24 Jun 2024 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f2mQW5BI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50E22313;
	Mon, 24 Jun 2024 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719257516; cv=none; b=d/bZriHUU4mdZYBhWqNVkNvha90BjuDbHyid3fsKODdKXPs67Cy12MrNiJaPeHjq4gdxWtqIx/jbODkEr8xUsGrWW6oj77eVGSAfUnuHDvih+uMcVyGmWOcy+GYP5EgfjSiDxjxAyLUPuNU2AMUVaJ+f0wMK+0KQ/h1Sr6nBIwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719257516; c=relaxed/simple;
	bh=WO5bItYsgm4x9pwloWwGJ++ymNZPqAykTIN55gh+o5Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JXCwUX0lSQxbs2Nx0qc2pMibTJM456cPQhuME7uD552ExiAs9gnO3JPcKSy+SQ6l9/J4HN7txyfdI01But+ewB0jIutz5XZgv01MrXX+45TeQtSH5VX2sJ4SC2AOcmNZI5LSi1rnJMe5vyUtPSxVE+BMs8e9UYLNOfX1s3LS7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f2mQW5BI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F22EC2BBFC;
	Mon, 24 Jun 2024 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719257515;
	bh=WO5bItYsgm4x9pwloWwGJ++ymNZPqAykTIN55gh+o5Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f2mQW5BI1BXSMdaSW0V2Eg2aSozyjzN8w5GvF3HdsotTv/seex9KXpqX7pSSkiX6Z
	 gJ6urvSNN9CsZd1fS3AXc/JIbrrRicuswhDOGtkBkdqAmy4NteCbmm0KqgjQn3CyyA
	 6cywjTV53TQt5Q+7hM/QEsbSNjWjDSYqgoXyhPq4=
Date: Mon, 24 Jun 2024 12:31:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, imx@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 f76698bd9a8ca01d3581236082d786e9a6b72bb7
Message-Id: <20240624123154.4c3125c3093636de35b407dd@linux-foundation.org>
In-Reply-To: <202406230716.DQbMBKh0-lkp@intel.com>
References: <202406230716.DQbMBKh0-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Jun 2024 07:11:24 +0800 kernel test robot <lkp@intel.com> wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: f76698bd9a8ca01d3581236082d786e9a6b72bb7  Add linux-next specific files for 20240621
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202406220754.evK8Hrjw-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> drivers/soc/qcom/smsm.c:(.text.qcom_smsm_remove+0x70): undefined reference to `mbox_free_channel'
> 
> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct thpsize'
> include/linux/list.h:645:25: error: invalid use of undefined type 'struct thpsize'
> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct thpsize'
> mm/huge_memory.c:455:21: error: implicit declaration of function 'to_thpsize'; did you mean 'thp_size'? [-Werror=implicit-function-declaration]
> mm/huge_memory.c:455:37: error: invalid type argument of '->' (have 'int')
> mm/huge_memory.c:558:35: error: 'MTHP_STAT_FILE_ALLOC' undeclared (first use in this function); did you mean 'THP_FILE_ALLOC'?
> mm/huge_memory.c:559:38: error: 'MTHP_STAT_FILE_FALLBACK' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK'?
> mm/huge_memory.c:560:45: error: 'MTHP_STAT_FILE_FALLBACK_CHARGE' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK_CHARGE'?
> mm/huge_memory.c:579:17: warning: assignment to 'struct thpsize *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> mm/huge_memory.c:579:33: error: invalid application of 'sizeof' to incomplete type 'struct thpsize'
> mm/huge_memory.c:583:44: error: invalid use of undefined type 'struct thpsize'
> mm/huge_memory.c:608:15: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
> 
>
> ...
>
>
> |-- x86_64-randconfig-014-20240202
> |   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-thpsize
> |   |-- include-linux-list.h:error:invalid-use-of-undefined-type-struct-thpsize
> |   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-thpsize
> |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_ALLOC-undeclared-(first-use-in-this-function)
> |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK-undeclared-(first-use-in-this-function)
> |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK_CHARGE-undeclared-(first-use-in-this-function)
> |   |-- mm-huge_memory.c:error:implicit-declaration-of-function-to_thpsize
> |   |-- mm-huge_memory.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-thpsize
> |   |-- mm-huge_memory.c:error:invalid-type-argument-of-(have-int-)
> |   |-- mm-huge_memory.c:error:invalid-use-of-undefined-type-struct-thpsize
> |   |-- mm-huge_memory.c:warning:assignment-to-struct-thpsize-from-int-makes-pointer-from-integer-without-a-cast
> |   `-- mm-huge_memory.c:warning:passing-argument-of-kfree-makes-pointer-from-integer-without-a-cast

Is there a way for us to obtain that config file?

"mm: shmem: add multi-size THP sysfs interface for anonymous shmem"
moved things into mm_tytpes.h but didn't include it so perhaps this
will fix:

--- a/mm/huge_memory.c~mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-4
+++ a/mm/huge_memory.c
@@ -20,6 +20,7 @@
 #include <linux/swapops.h>
 #include <linux/backing-dev.h>
 #include <linux/dax.h>
+#include <linux/mm_types.h>
 #include <linux/khugepaged.h>
 #include <linux/freezer.h>
 #include <linux/pfn_t.h>
_


