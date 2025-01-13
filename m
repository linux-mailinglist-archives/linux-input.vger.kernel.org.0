Return-Path: <linux-input+bounces-9172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB268A0B422
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 11:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A155B3A2195
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 10:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB0E2045BC;
	Mon, 13 Jan 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHA8ng/1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536072045B3;
	Mon, 13 Jan 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762934; cv=none; b=QKD0IMjxO4TUyB14yMbrpPfgF+Hy15gB2rYoiGec2fGYuZDS/ezia9gvP3sYCj7LgRHnrraVa0P+1m4WQ7M+5VSyI/StYuoZGVbiaIvhEnJRBRC6oU9SE25XylDEVVerlydAw46wKuzH+hz8U8SboiRbuwIBLZlpwZQ7N2e0ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762934; c=relaxed/simple;
	bh=65NhXLXw009jdra+EqXcXxWDihPnDmAyr55LlTBvIGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ad1rVcpdq45D5MD2w1Hvjx6h1BGWoA6Vlo2MXSD8441OEBFmN7giEM5e7BP+eldmV35LVqlTpQjYla14GfrBUEOXb2gqtquD9tu8uAitOFxCi9JnLErxMKv3G0ZLeHDStCMvBUbMk5jl9kSdzDmN0Bs7OQ0V776Byi7Nk+w9a0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHA8ng/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40FFC4CEE2;
	Mon, 13 Jan 2025 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736762934;
	bh=65NhXLXw009jdra+EqXcXxWDihPnDmAyr55LlTBvIGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OHA8ng/1JAUN9JL6p3x2HBdy5pitxDWGkXSXuvhmLfAgPLuWPJ5RQ6HaG1iHq6jXM
	 TmawAumAZy8Ct18z7IEF68dDGCt+8gMSVnZHSWtXhNw0Qi7PA+gmVHTGqfOzE+DK1P
	 uK1OeBx76jdbV/huFpUj27SFuQ3pIZdDCepkTuQ2i2P+D+p+ixvCkRxcMFllHfx2Nj
	 RL5cdiZQz+0Knh+V8Qur3wbaDjpVTuc7RVsMvEqIaEIgl31LBZBXBYdgFNC5BxVuHV
	 qPztHBXuC4Vr22xmYjUb1TkGm5o21A92YQchue5CZol6cbBI8Xlllrw+0XmxpGXHF5
	 kdHyFjTWmOzFA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: dan.carpenter@linaro.org, Even Xu <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com, jikos@kernel.org, 
 mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20250113085047.2100403-1-even.xu@intel.com>
References: <20250113085047.2100403-1-even.xu@intel.com>
Subject: Re: [PATCH next] HID: intel-thc-hid: intel-quicki2c: fix potential
 memory corruption
Message-Id: <173676293248.2279462.11753863703231864187.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 11:08:52 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 13 Jan 2025 16:50:47 +0800, Even Xu wrote:
> Use U32 to get value from ACPI and explicitly cast to U16.
> 
> 

Applied to hid/hid.git (for-6.14/intel-thc), thanks!

[1/1] HID: intel-thc-hid: intel-quicki2c: fix potential memory corruption
      https://git.kernel.org/hid/hid/c/d08a1049659a

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


