Return-Path: <linux-input+bounces-6244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F096D941
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 14:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26426289E42
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C593F19FA90;
	Thu,  5 Sep 2024 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rneGwkAZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E319FA8E
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540362; cv=none; b=EdCi2vGTT36ohNVR/MhrerFCGXqf5JThxCBjX7ey4w2Kv7oMefjMBcN2fKx0JY9WphFmhhyN5ea0vyl08ZiHjhq4X2WymP+f3Q2rREfszKmwaNkyBIvXuuTjELdVKEmfPSUM3BP1HkkPzjs5MiU0VFSF/KZTq/N6tc8tWe45qI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540362; c=relaxed/simple;
	bh=B/YR9lYqLdVRBeXc1Xfthshtjtzq2cTKS2LS4GLG7bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8qfolaR6dJgslqGT0LtGTo9QHveXWze0msquSiZTM4dVC03AgWrZ67ZlrRyihX5ujjRAID59gdut3dKz1WN1V5kbT7lyA2D03xPsbYYVkz+z4D3nYCe/AXgpS2id94sJdLZJNSvk27kjlbGRv0vMUsYGbO/v07SLxBzMZYyvTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rneGwkAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B840C4CEC3;
	Thu,  5 Sep 2024 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725540362;
	bh=B/YR9lYqLdVRBeXc1Xfthshtjtzq2cTKS2LS4GLG7bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rneGwkAZPFsphEvs4pj6chWkgiFnAaJdfKp8arY4Z0KaC/kdDunQ+v5Jy3n8kPLrb
	 yk1ROqpNmAZKOswWDgrAQwLDdXT052pk+EbamWlfHrEy7ErH20LKMBjctOfiwatj9a
	 wGaW5Ml/Th0z+fQRBXS0/4/9jO6Kucpsl3X3dSaQNnV0YfdOpsvSslS3TXkCh/fE6q
	 tzLrARt6Du2amRGcs7k7QwHs0ES7Kg+wiu+mrGiR1GzAqign7AqmratGu+6FTTRybr
	 tJ6VlJJ6p31klzAH664d79vtBLxWVDNNi1aYtb+ytLCEAYSlzAgYHHIk5wzvz88HV4
	 RLLkzgYLENr4w==
Date: Thu, 5 Sep 2024 14:45:58 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-input@vger.kernel.org
Subject: Re: [bug report] selftests/hid: add tests for bpf_hid_hw_request
Message-ID: <ayip6pt5taomoopssf7gzmddu22pgicg7m7ddjxkn3dbk3k63d@kcsuev54kom6>
References: <a8082ffb-68f7-425b-a3f8-f9f14dbf2a92@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8082ffb-68f7-425b-a3f8-f9f14dbf2a92@stanley.mountain>

On Sep 05 2024, Dan Carpenter wrote:
> [ Moving these functions around made them show up as new warnings. ]

Thanks for the report Dan.

> 
> Hello Benjamin Tissoires,
> 
> Commit 4f7153cf461e ("selftests/hid: add tests for
> bpf_hid_hw_request") from Nov 3, 2022 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	tools/testing/selftests/hid/hid_common.h:212 uhid_event()
> 	warn: assigning (-5) to unsigned variable 'answer.u.get_report_reply.err'
> 
> tools/testing/selftests/hid/hid_common.h
>     207         case UHID_GET_REPORT:
>     208                 UHID_LOG("UHID_GET_REPORT from uhid-dev");
>     209 
>     210                 answer.type = UHID_GET_REPORT_REPLY;
>     211                 answer.u.get_report_reply.id = ev.u.get_report.id;
> --> 212                 answer.u.get_report_reply.err = ev.u.get_report.rnum == 1 ? 0 : -EIO;
> 
> answer.u.get_report_reply.err is a u16.  I couldn't figure out which kind of
> error codes it's supposed to store or how they're used...

It's in drivers/hid/uhid.c:262:
	req = &uhid->report_buf.u.get_report_reply;
	if (req->err) {
		ret = -EIO;
	} else {
		ret = min3(count, (size_t)req->size, (size_t)UHID_DATA_MAX);
		memcpy(buf, req->data, ret);
	}

So any non null value triggers an error, and furthermore the hardcoded
value is -EIO, which probably explains why I did not noticed it.

We should either store EIO, either a plain 1...

Cheers,
Benjamin

> 
>     213                 answer.u.get_report_reply.size = sizeof(feature_data);
>     214                 memcpy(answer.u.get_report_reply.data, feature_data, sizeof(feature_data));
>     215 
>     216                 uhid_write(_metadata, fd, &answer);
>     217 
>     218                 break;
>     219         case UHID_SET_REPORT:
>     220                 UHID_LOG("UHID_SET_REPORT from uhid-dev");
>     221                 break;
>     222         default:
> 
> regards,
> dan carpenter

