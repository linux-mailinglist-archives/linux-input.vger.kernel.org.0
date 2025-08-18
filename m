Return-Path: <linux-input+bounces-14077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E9B295FC
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 03:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5004E6C01
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 01:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089BD4C98;
	Mon, 18 Aug 2025 01:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOLxy4f3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420D3FE5F
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755478854; cv=none; b=NOlmvHwaHJ/sXD6RC13neyG5JgE1oxp81fr9+mHGQfM5NRzzZX1RCSen0wnJCs+EroQ+lxq6M+FTPNkTvGWc5rz1VLmyN+n1NY3RmtKasLGAScHmP00PcYY1pu+SAbh1C/r697FjfKGLWx1nBhL9CKENurjOC9CnmI2wHlTb64g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755478854; c=relaxed/simple;
	bh=5hobYoSyfX7MVbNRx4d4ILz3mOpPgQBXGZVGIRr7Pds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxKG3ZkuKD5nOyzZHV+cnoMAMnBNOeC5behcfIbQRJJ9TDeGXo8ZOEYTnTSFa2b2DxQ/8QceTmS5QfXv/ejvKRqZPLIPSPme1qdCF0fCq2Um4BDxURyILPBGLlWUxGFUfzfl64Zw/5xe043ORHJubV/vwywPSdaU+z1Orb5sBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOLxy4f3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2e8bb2e5so3928644b3a.1
        for <linux-input@vger.kernel.org>; Sun, 17 Aug 2025 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755478853; x=1756083653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcCdFPTuu/D2HZYbbKtGM40X7+5+M8MvfJcOxNPwkxQ=;
        b=hOLxy4f3ByXw1wcqDeROOQd2Yp3mZJpfViFqQ/Ldx+HR9+VPdbw2CxSYQ+UyhePzyB
         ftBxaku2TdRqlqvS/5XgWDCZGMPeNyfobEnbjLySWHNHfvIkdoATM839NnG3oOtjUgeA
         M8yghO8FmK3AAarnytGre6jQGGkyqlqTdB3cGnbODvYNIpFTOqcffgRJoK/QHMB/YG8M
         uBpAuof7pIvt5oqklaAav+mz8r5viDjyxrvgyCaf0ludaOizDXegF4W1L8kk8NcDAUMG
         W04Gap02i0Uwx8LbjJqP9wp1JDpvNWMXc9YEF3XsPmkP10KCckCmQi0la1nX+GD9XZmO
         w0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755478853; x=1756083653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcCdFPTuu/D2HZYbbKtGM40X7+5+M8MvfJcOxNPwkxQ=;
        b=A3adyh081L4oKli8pdjOXva4Jxak7lfR5/m/QXkQq3D3bl2ElnaEG0oK2tngB8J88n
         TJJR7gYH9fF97p1v5bxuXauNUFqUQyo+sAx7lwBNKJyoM24Qc8c3mcGxS0TI21p71PMh
         vJdTIM7LjmgIwVttzQfPoZ7KtPNd2JCkgbC7MVHQFEssU3yIeWw8m742XhFOGu0S5jAs
         nl5DZhJLkFxXnGz+bH0MHQtkQGQ1i0TSoW1SSO8WhCpIR35gPqwZsqPj+3mY992l/QUT
         F2FSkB5h3cW6b8oEXS1Q667W0Fb1+NNwypqLYlXeQt7tyrhMLf+GLwJHWhfOHxMccOTK
         u5OA==
X-Gm-Message-State: AOJu0Yw8lSoCcdFNLyfaPnZdYNRzwSXuYjQikRGfzUu4ACxMBR6Mt4Al
	w9/pBLaofWTDE/1XgTywX/twQpWNb033ZQd3apMiSY2Zox01Jr+CFrwd
X-Gm-Gg: ASbGncvD7CI0I2DQrJyyac5IFWfJPXRfvmw9IAe41Mw06LsvC59MbGurg3HR36fGWx2
	Prsr6MSx+40h5e9fVJPr+cJhO5vYwf0YawE3PyY2Yhm9BtRDMOSRmU7wqwdXROl0CuhdaMhDVJW
	5Cw0sUYY3EHAZL8PQDX70ZGTMQMN67DHUPwBmm0hgDC/k3nHAtcewUUqII4Jle8wqu83ocyc9gj
	ZQfNR8dNj2c757Dxpv4hQZ8MCM2vPzRtw01BMt5nUAWL/RSjTc06ZpgKTZxrtoraWtG3EpqYx5H
	p+4tnDkvfMgd/kr/c7ANOVGfDJ/x54qHxyzflNeC86IZ/Ogfzq8dDinReIdbnoXbXdM7/Q4u3Qv
	yic/p8Br3SWTJqcSLGtU0Ew==
X-Google-Smtp-Source: AGHT+IE55K35kUTFQojxF0IwqaG35lGix8H4x7i/WJdOu9O9bE6xkXUa/w1ThvPlXBFfpKGlZutjBg==
X-Received: by 2002:a05:6a21:9986:b0:233:f0c6:a8a4 with SMTP id adf61e73a8af0-240d2f066a4mr18188280637.31.1755478852577;
        Sun, 17 Aug 2025 18:00:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45566f98sm5803693b3a.72.2025.08.17.18.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:00:49 -0700 (PDT)
Date: Sun, 17 Aug 2025 18:00:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - avoid enabling unused interrupts
Message-ID: <jqtokes6treccrh4xuawyiidydhsitpl6kbyqov2ge2vroklrn@ly7uxtl6fnbf>
References: <aKJxxgEWpNaNcUaW@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKJxxgEWpNaNcUaW@nixie71>

Hi Jeff,

On Sun, Aug 17, 2025 at 07:20:22PM -0500, Jeff LaBundy wrote:
> If a proximity event node is defined so as to specify the wake-up
> properties of the touch surface, the proximity event interrupt is
> enabled unconditionally. This may result in unwanted interrupts.
> 
> Solve this problem by enabling the interrupt only if the event is
> mapped to a key or switch code.

Should I tag this for stable?

> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  drivers/input/misc/iqs7222.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index 80b917944b51..ea26f85b9e9e 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -2424,6 +2424,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  		if (error)
>  			return error;
>  
> +		if (!iqs7222->kp_type[chan_index][i])
> +			continue;
> +
>  		if (!dev_desc->event_offset)
>  			continue;
>  

Thanks.

-- 
Dmitry

