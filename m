Return-Path: <linux-input+bounces-12774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB99AD42C7
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406353A5207
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19A42620F1;
	Tue, 10 Jun 2025 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+39/T0G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0529D19;
	Tue, 10 Jun 2025 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583211; cv=none; b=hkWTQlkNM5gHKlocC2+3/H51PG+FMWVkx+kL52QsVyG6UkSwZ1w4z7xgCDbRPGPPg2Y8w4OTx3P9znq2Evr05yCG1YlTRPxjI/QnUcKQt3t3rGTM/Zw50eVUqpmREwaLEtzViZWX/sHFo0iAgQDFL7VDS03iyMvcsc82PpOAEd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583211; c=relaxed/simple;
	bh=uWEHCjP/KRrZErAuh9LLpnCXLlXk3ORVfs06Q77vSD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HrWWQ29pK/yLdXqDl4z3vJIAeuKYBP82YlOyL8bONe5NDc8ZE9C6snwIJ2l/4RiD0aW0TEu6F1MwV+cAoQD2z8t2I3Uz2tC/t1jNxq1aqiqKFjEZVAoPjB1n/ay3cZg8khpU/sIl+hysJwmJl4k2ykfZYCpxyKkZ3RT6lhppfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+39/T0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91553C4CEED;
	Tue, 10 Jun 2025 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583210;
	bh=uWEHCjP/KRrZErAuh9LLpnCXLlXk3ORVfs06Q77vSD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O+39/T0GrBuDCPJNkybXBIF6SIJEoXRU/xU2NN1v63kXJtvlppCmxdbYt7CqITYQY
	 COhaYCjXpYAHRM2gBWpT5+TaGgtMD1dIr5LA1P2ouqMx0r2ZpCN3B2SXF2XZ+qVZRh
	 Vs+wD/r5KXFFh5vxuw8qMpVidiOT07ZPSG1js20cxqPtDGq44cY6IRiy9D5k3ARLuD
	 FhTpuSGQm/89RgvoC+TDcyMZJzwP5CxO+j0FqCfYnG8vwEJcI7S3I3zs3Bqf6cvNw9
	 jvlunUnv2ahayWZaNxcsrYZdgcvuu377ikfngEjnbudRq7jajVvQ183irdGlhpNHFD
	 8ydi8EUAUqZkA==
Date: Tue, 10 Jun 2025 21:20:07 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Add wake-on-touch feature support for THC
In-Reply-To: <20250514063735.141950-1-even.xu@intel.com>
Message-ID: <6qpr5041-1831-sspr-3395-428r0205s8n7@xreary.bet>
References: <20250514063735.141950-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 May 2025, Even Xu wrote:

> Wake-on-Touch (WoT) feature gives system the capability to wake from sleep
> state by user touch event, it depends on platform providing Wake GPIO
> through ACPI resource.
> 
> This patch set adds wake-on-touch feature support for QuickSPI driver
> and QuickI2C driver.
> 
> Even Xu (3):
>   HID: Intel-thc-hid: Intel-thc: Add Wake-on-Touch support
>   HID: Intel-thc-hid: Intel-quickspi: Enable Wake-on-Touch feature
>   HID: Intel-thc-hid: Intel-quicki2c: Enable Wake-on-Touch feature

Now queued in hid.git#for-6.17/intel-thc.

Thanks,

-- 
Jiri Kosina
SUSE Labs


