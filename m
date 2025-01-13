Return-Path: <linux-input+bounces-9171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D3A0B41F
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 11:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B6218836A3
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 10:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D01204588;
	Mon, 13 Jan 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcWYS/cx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBE1FDA6D;
	Mon, 13 Jan 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762932; cv=none; b=B5GV4uf3YLj+bYXvfUNW8eOaWdABAEPRHvJOvLFb9djLAI+IDVPeTXPnmtEZBOku5JJDDhCplA5/dmZpiyIVKCfdMDUpmx8nKvkBhbn9lkvZB0OsBn/+OnzaqrMh81YmAE5qhgNdxoAL4DR2yZXDiEOSlgaCZYZilZTqhmh/TfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762932; c=relaxed/simple;
	bh=eySkkCwzKjY+fYHnzDS+b15DvcroULCRjUUZppbqXSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CsiCM0BfxyrRqsLV7PqVqLLq7JA93Cve4rC4gvzkE068+Ggr/ro6ST/9ICn/NEjnIjMrP+D313RaMU+XUqUTAjLbI2YP1k2G5JQPmFWqlDb6t7kElzuE/UBuv8fWP/Zp8ismrSDaLv+i50JamYzGgBb6rApp1D46qo1wQiB243M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcWYS/cx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED5CC4CED6;
	Mon, 13 Jan 2025 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736762932;
	bh=eySkkCwzKjY+fYHnzDS+b15DvcroULCRjUUZppbqXSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcWYS/cxzNm6PkbKtiK3FTZ1dcdUmsRRcuHnuZ2oqYPTEmnvcBDdjxKzXYo4+DXat
	 cQs75Rpx25SgYYFTpXcRqwoBhahagrBZoDQIAYNgoJwdNfKqwg8z2wcjegIoDdzSKE
	 O9o0fbKjqExE+lkh9NAxHKO3s1ouBRSepD5bYfRb9yJQjOFA8x3SfuceM4L5UKnidG
	 i9QvIvwLSnEbcvQiaa0123TOf2Kg/SKWoEgfdtLIOr5PCywD/6dtpMjN4PKkNBjW4G
	 Moa7VUqAjv0PVISINfYMryiyVvp12gsDPu3f6IyfW76LSTAe1soyIR6HfHEt69/MbU
	 0VnDmFX5Tr1xw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Even Xu <even.xu@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Xinpeng Sun <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
References: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
Subject: Re: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Message-Id: <173676293037.2279462.18017730380941074048.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 11:08:50 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 13 Jan 2025 09:15:41 +0300, Dan Carpenter wrote:
> Return -ENOMEM if the allocation fails.  Don't return success.
> 
> 

Applied to hid/hid.git (for-6.14/intel-thc), thanks!

[1/1] HID: intel-thc-hid: intel-thc: Fix error code in thc_i2c_subip_init()
      https://git.kernel.org/hid/hid/c/0b0d62fa73f2

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


