Return-Path: <linux-input+bounces-4064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200338FAD5F
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFEDB284850
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2691B1422C9;
	Tue,  4 Jun 2024 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAqMnhL2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE031420DA;
	Tue,  4 Jun 2024 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717489197; cv=none; b=t/Spg/dutvGTs8kczKnpwxM34MZowb/Rjl0gilnTwuY8wgnsmvIKtuC+S1YGFYNyZIxlcgCanW0LSUcaUyYupjEy/HMcmPPB4zeuf+SwUK6yN+tMgTLd/8EMKBy/sNASwy71DZphas1M9SV+nRwvF9imY1XcJuAPZtFNzyDo5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717489197; c=relaxed/simple;
	bh=fu6v8bf/EpG1Xc0slSQ2BEC1OPFYg8rm2GfDz1zLogk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PW5gigI1KzWumZQ/RJL2ex+hbXnXYd6zPmIa72ELaUDYr3xV6agDZnAeSUQaGTJogqjzNOwrKIDMT6ChA7MKYv/f1A8NCEW47V2LDSWlgsg+EWLDkVAJVdJVxhOlEQ1+wy2+ddhpjIVwsy01RY/RnegSSBRweGaLH5k18ZRb7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAqMnhL2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2B6C2BBFC;
	Tue,  4 Jun 2024 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717489196;
	bh=fu6v8bf/EpG1Xc0slSQ2BEC1OPFYg8rm2GfDz1zLogk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sAqMnhL2Ef68vj4pax+ndpgbEBVdORijyEgmj/N4TU/wnSXdATiyHx/JxEPVEVxl6
	 JAu6zHZUQ9HNbq/KLo3lEQtDlmqEqEfQsqcqGysB7wxisr0XCVBHeS3Ej5INqTDFmb
	 dlAEx9BXZNqOn3sqfOrQjt2a8rLkto1pMjA0DOeGRvuNJwJByhGOs7aO8l0iMwqXRn
	 PWid/E+cif7iEFk4HbDTRebRVB5iVieckAIr9250PZAcx1uzpNURAMe36uFmzlJHJU
	 walvXdBBjyt2MKDXAigk3aKa43Em7X0V9qb9ezb63CDw+a9lIMvEWtzBUKfjyAqxnr
	 2JnocKiVBnhvA==
Date: Tue, 4 Jun 2024 10:19:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/2] HID: intel-ish-hid: fix some 'make W=1' warnings
In-Reply-To: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
Message-ID: <nycvar.YFH.7.76.2406041019450.16865@cbobk.fhfr.pm>
References: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 25 May 2024, Jeff Johnson wrote:

> Clean up some 'make W=1' warnings
> 
> ---
> Jeff Johnson (2):
>       HID: intel-ish-hid: fix ishtp_wait_resume() kernel-doc
>       HID: intel-ish-hid: add MODULE_DESCRIPTION()
> 
>  drivers/hid/intel-ish-hid/ishtp/bus.c | 2 ++
>  1 file changed, 2 insertions(+)
> ---

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


