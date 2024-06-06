Return-Path: <linux-input+bounces-4165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4D8FE1DA
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371931C25480
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5E1552F7;
	Thu,  6 Jun 2024 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7yfIf4b"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470D1552EE;
	Thu,  6 Jun 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664104; cv=none; b=JEDw8kLzb5Wvc3ryJfMz9wdDrBuZat9mpji4UUVFtI9Rx5zaJ/q1Czg4O/e71N6DMa+Wym+x3KcUYBUsQZVlyjBZWZ6S2b+9DxHCqNy5phMg3KQlCKTZeRJOpYUaOuzC2yE7QZV/5s1jNiYLuPYu/k2PhYFag8CcDH6zPaacPfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664104; c=relaxed/simple;
	bh=C2TROrrNBRL2ezXCSxG1MCpQJjG0zgUtFS4T0SG/1CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HMMInrqbP9BMgik37OVQeS/7I8lRvnngJ/s+r8F6xzJUBNS6/TNUk9tir5/CkaPSmsPDzwa0KDwEhyoN5mp0UABktI4NG02bchZ8qprusZEsM7KcBLDdwxNMb87xwsM0ZkUzEoTsa6owKe1un7i2VOgzhAa1Fwrb2OiUn9iNCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7yfIf4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF9C4AF0F;
	Thu,  6 Jun 2024 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717664103;
	bh=C2TROrrNBRL2ezXCSxG1MCpQJjG0zgUtFS4T0SG/1CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m7yfIf4b0iZqT/zwRn175w13m5IG4A5GqQBjdcoK24FgEvJxUJ8XkBucW4fyqxgRP
	 xHfVUuGRpS2AuIU+dokwhboitndGtgkrOQEBpkmSmpUh2WdX5HwwGaAo9bbhDLrX3c
	 ewADXZXZVUV14YtLK5SsxAMi7lJex9vTUdDMWfwxScvqIyeJ9gIB/AZn1jh86yz8Zm
	 BpEGqf5SN1zYw4XayT/lGFzCDdfUz49VONFMyIxohqY3esjyfLzwvHPhOXsrYruyRY
	 LuExfE5TjG/TR7VLR6XnegA1qmCUKsHn3y9E6b5z94kam0F4IABrSwtjrInzvofrL8
	 GuU4G7Pc3fuGw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
References: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
Subject: Re: [PATCH] HID: lg-g15: add missing MODULE_DESCRIPTION() macro
Message-Id: <171766410205.2923458.1128729362499576283.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:55:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 07:33:01 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: lg-g15: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/hid/hid/c/e52a7d0562d8

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


