Return-Path: <linux-input+bounces-3697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D88C48E4
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 23:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15651C22E91
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 21:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6761292F3;
	Mon, 13 May 2024 21:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFISoqWZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA386260;
	Mon, 13 May 2024 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715636002; cv=none; b=Ka6kCbu9J0qnYTTCLAqs5tVb5vRYVxvAw3azQPSAhmwrWxXfQVebiQ2BO7u2omMMY3dVYnNxAayThWoYZIwwcq326+jP5G2Pz9S5crviAk/WVYs5Z8p82kCP7BOmC6LipBRyhkbtDlHnGrjMG9AVoonPDnKgSZw9RZ/nh/9Ncdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715636002; c=relaxed/simple;
	bh=qi4gfY7CxY5lo/QzsF+r6vCRWH2P1sqzriYVwDiX6K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCamAP7WKn4V3lgKbZtwC166WPIcF6ILqpfKInQndehTgerN5lDJl93GbV7nd0T1dGIBdx7Da/lcZmujkRpQnfFFeM912Q+7EhgTC+4VkVb5tcR6Pvb0h3t41+Hi6LiChcSZmilIdWSyzjChURPqV9matgj+vSuay5w8mLK02WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFISoqWZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de5ea7edb90so4965859276.1;
        Mon, 13 May 2024 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715635999; x=1716240799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDDzT/EnD2tZjQ0C6IkF0YOSXhDST9ekY3DugUgHjdc=;
        b=kFISoqWZbGG7I22upnciDiQWpX33ZAlkn7lkCRq06AC2NXTBS8Y2uhIw7Vl9kdCqeY
         XDYrweTzNb4aHJoRR+WT4vmKZj0TijXJDTdnv35eB4MDTyG50mJM2qG8jCtpB2Mzwtbp
         4xW/UWl+K8XqAVUspXYJW1BtU9Nz0Hm+KLueosJ7PygJd2tF0G9B79WRkebd1ps73kNc
         V2Q8QSFjlzHcVc55nJkSZTJITQdDwmEfM3RkMl8VAZfAFaegKnGu5lpYGyAoCLLVYSm3
         ldIQVcWWE5dOeNgvlF1ShQpZycyoZUuSGVqcwc7MALKemr1fr7d9h0TayTHvRrgGZjqg
         3QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715635999; x=1716240799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDDzT/EnD2tZjQ0C6IkF0YOSXhDST9ekY3DugUgHjdc=;
        b=wQ4Z6JiwLL1Fpq7Fjv2YWzeyDFQAOAXXc4M2XYDibVXCKeRrQzXhZb1VBo3/kPtfpW
         rBIN7x5KpjWVenAeEm76sgHAWXhxvXvkTB0z3Nw2mgOeRNyklO0yjNzbkyP6Yr7RVOEI
         L/Dud2P/j0xU/kU83t7BesVqe17WLZl/Z9RcDEqSpdzk3/Ctb2MMmKifbhEqQVmry78b
         WIvDULIoLPgh28WE0dKMbVd0IzCS2A50FA49GetG+DDvuB9GBnBszviAVkU1oXLfOLJz
         MrbTEX3SV+D3ZCQaBxaRa0i+Z0hqoR20L2ovr0S87nXnGqzxlX9gS03iiUYdNey/irNa
         KMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDpZTmruTPRo3SIMurNDTyS5ULHHYvd8eZOGWebOjaVYseISK4+8BrLm2prwGCBKubKAE8gy1NK5i7GnRTYTibAY6YXeD1a5VOkdhDaBziIJZVbRFqDk9y0pK579oKbnglti7N3uv69rQ=
X-Gm-Message-State: AOJu0Yz60dW4/7PBu+3tqXJcB58EaKn0uTgMAWIRM2IxXYgF7hWwmvRd
	Vpqjt7P9tz87eXFlpZNfk//cy6lh3meWlqDInbgM9XlFAA8xCK9D
X-Google-Smtp-Source: AGHT+IHXCO21/5LF+f5DhVdq1Hm2pvMdxOCpJ2xdW+rWo8rNV6ywL/eglmhyai9r/2VGVklghbBSiQ==
X-Received: by 2002:a25:dc87:0:b0:de5:9e4b:4c92 with SMTP id 3f1490d57ef6-dee4f355c09mr11247566276.49.1715635998964;
        Mon, 13 May 2024 14:33:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-debd372a1d6sm2300161276.19.2024.05.13.14.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 14:33:18 -0700 (PDT)
Date: Mon, 13 May 2024 14:33:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, neil.armstrong@linaro.org,
	hughsient@gmail.com, broonie@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: goodix-berlin - Add sysfs interface for
 reading and writing touch IC registers
Message-ID: <ZkKHGy0qvFzSoVhl@google.com>
References: <20240513123444.11617-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513123444.11617-1-charles.goodix@gmail.com>

Hi Charles,

On Mon, May 13, 2024 at 08:33:37PM +0800, Charles Wang wrote:
> +
> +const struct attribute_group *goodix_berlin_groups[] = {
> +	&goodix_berlin_attr_group,
> +	NULL,
> +};

This symbol needs to be exportedsymbol needs to be exported..

Thanks.

-- 
Dmitry

