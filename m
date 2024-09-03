Return-Path: <linux-input+bounces-6095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18396A32C
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 17:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6CDA1C22DCD
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 15:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0909B17A932;
	Tue,  3 Sep 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QESuzkL+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66AA1E492;
	Tue,  3 Sep 2024 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378433; cv=none; b=nIXcPqnz9zLSJxWXM2IqZ+57JJ+IQWXIuBqGBBOtRBXmMFIfugNEA/GbDIGcsl5rniGciKRbVFdSFEVMyQf9igC21lpBsb4Gwx0KIDXd8PVc+Yzb/9EB0ecj+6f1IwAKAuao+8kUssQcrTfQ1TBnUjlkazbks4woK/tQ6tSN0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378433; c=relaxed/simple;
	bh=5kUdSagbe/GJ8lJhvIzZg25K9C6/1izhcdvJhYWGWNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVYAK1AgKeDI7OF7WUU6SPJHGLC1vwZsmVmQUVqeftIjJ2HUioajwx5obIfD2LJUgxGRYRyYOkDFbKW1td0/RzJi0UCe/j5JkKnnE4Q4Gq9AksVA1YY5yhVL7opsfziT/ROALHpJJPSviqWanvB+rs41KI3RfiYpV7Z9YvfYQ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QESuzkL+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so2718890a91.0;
        Tue, 03 Sep 2024 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378432; x=1725983232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/FRmqd1fd5s4pr9pNoowMmPBZe4VgMiMQoqWg50Gtk=;
        b=QESuzkL+AZyy1WUhh5RQYu5Fp4CDlQnE1Uxrlv7PycJQHKim0LE++3+AHI0EPmgnFN
         b7Q3KtwoR06Vluqmim9NgFcqFPd8de62MPux1i8WeJ0XX+2/oJ0BrY0wak/Pj6EdAISv
         UnPZiy672tsyu0m9Kwi9uvMxSB8SwkgbwLVOrfPrT09aORz2ZeBAY83czOxvpfl3rbHa
         cLBA0IQh6KpI0QPLXS/9G8xOHFwT2T+7MCZnv3vhalrRKTbrOaiM+G3UWubf2ODxpyYS
         5oLZRXwX13G8kH48dXy8+WaiAdZjvfpTZ/sZMjKjrHPE9XbYgOp7gYeJn4433V2BhCKE
         fxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378432; x=1725983232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/FRmqd1fd5s4pr9pNoowMmPBZe4VgMiMQoqWg50Gtk=;
        b=Ciw/scWauAFjrmNm9OtPN8eFXHjY9RI0LYdECDUToM+7YKYb7+eN6LNZGj+lLrolal
         UM0IvRoqQeE96ij28TYEPLWDRFLRV/WWf1hJhoxIKj8glqZweK9p1UWE3II6ZK7xZrQ+
         Iw7wtP+yOJNspnfuCwAg2AAkGQP31USb07l15TSlQiJEbBiXfescGOg5gLNQIQzQgE9g
         2h5lvM6FcQWrMRhQ6zBQ+jYtrMaJ6icURVd4aLpjHWp8bSySe4w4JoHSQO8QY0eRBcSG
         xGDqMa75g305Ne5a+9ZPH3QBRnHDO/zEXlgCHXyZCXBF2Cwqf0SQCe5Sd2cjFUBTlCGS
         IurQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJELg3DKwqi/m9T1uaoAWYcmXYwlNuCcClzXtDGi7Z/ujcCf9fz9uxLDdC0VSOWnNaj7F4dOQex00lN3jDj78=@vger.kernel.org, AJvYcCWm46zAqGd98J0LNdcfACmhJnJa4eFNS+/rUkede7SSR1FKnOYp8/fxf2lsf4Bjr1nt7B+LMLf217pdrbvI@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZQlCXjpOt/ayChswnPVqst1L4n4tIZnlAT2MZJryesC/cYp7
	NImIz+60nYStzMiFkZr9GRmaOQEukQ2WlWgWtn4Jx4Iey2ATjj09VUey2w==
X-Google-Smtp-Source: AGHT+IHIteDa49wYcvWfo7PiouXO3lBPb7jvb/m+6iuR+EVyA7oATaaDEX9vJPyBkY93nIIwiT22Xw==
X-Received: by 2002:a17:90a:ec16:b0:2da:6812:c1bd with SMTP id 98e67ed59e1d1-2da6812c3e9mr2003869a91.15.1725378431451;
        Tue, 03 Sep 2024 08:47:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6a38:89e0:6dd:908b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8b69a61eesm5716092a91.43.2024.09.03.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:47:11 -0700 (PDT)
Date: Tue, 3 Sep 2024 08:47:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: remove unneeded file entry in INPUT section
Message-ID: <ZtcvfGanifeeUFZL@google.com>
References: <20240903093948.122957-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903093948.122957-1-lukas.bulwahn@redhat.com>

On Tue, Sep 03, 2024 at 11:39:48AM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit b9401c658d2c ("MAINTAINERS: add gameport.h, serio.h and uinput.h to
> INPUT section") adds further header files in ./include/linux/ and
> ./include/uapi/linux to the INPUT section, but the file
> ./include/linux/uinput.h does not exist since commit a11bc476b987 ("Input:
> uinput - fold header into the driver proper") removed this header file
> in 2017.
> 
> Fortunately, ./scripts/get_maintainer.pl --self-test=patterns complains
> about a broken reference. Remove the file entry referring to the
> non-existing header file in the INPUT section.

TIL about get_maintainer.pl --self-test.

Applied, thank you.

-- 
Dmitry

