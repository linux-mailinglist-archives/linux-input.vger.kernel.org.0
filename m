Return-Path: <linux-input+bounces-8294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B89DAE3B
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 21:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40A328332A
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 20:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F59F14B07E;
	Wed, 27 Nov 2024 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+Oh6LAh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D501FF7D6;
	Wed, 27 Nov 2024 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737679; cv=none; b=ZM3vNRxcK/Mm4Cy7jNNXOi6R1/BxsGSi36hZWmCOKGS4hbNcNnj6WTEyemDX9ILRyjeUkB2vK5IHxeETo3PC0ldnacfRJUkg36zx9XZkKOEnwdXnrlvCdC2PadXHKkI+7w8ktTWZHMDjJM8LkW4Xi5q438IzZGp92EWXBXZE144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737679; c=relaxed/simple;
	bh=jws1kxJl5dXoighUChVtIrqo5GgIB20LFbSZdEb1+SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDLQ/1xwhKPbXk1CStlw4GKKskpzm5KjOXOrCe+2paaceYjoOXeqn12naj/1RDyJE2TueXaCwmPJC0hJ5ewd9eBNlUYY6KB4POqM3O23kfHdwP/4RIXBOe6W8gKuHG8nf2y62kCxoNG0aBZvHEOifQ0WTZO/iDPXa2t6iU9nOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+Oh6LAh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7242f559a9fso161791b3a.1;
        Wed, 27 Nov 2024 12:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737677; x=1733342477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNtWnaXZepM98YyIzvnlU9btgK8Sl+3I0wfijtbQqXU=;
        b=X+Oh6LAhlmhmFwkyMLXToaDq4w8ny2XX5ZASd307v1U+NTMnkO6T0fiaQg/aNJ3NMI
         sO5a6qj+x7h9rB7oJ9Xf3LwPCFq/UeJmH68MxGweYgV72AjqKE+10VFPXsxtYaZ34OCi
         4Yjp3NQuKsklTnT8TmoZ6iBzyUtPBkXsI7QfCLuyOF+7H8eW8UqeOowobXFH2j5rEp4Y
         dRADm4OHit8cR3/ckmwATRE/Xd0rrRileqjXycYIQcOP06t0h3X0UXYix7VFF9d6WpL8
         dL/yyXNWQzDACJeOIEniW8yFJYzuxjOj518zGZ6idRx6eUtPCVU+YGoytYX6VAc+dapl
         tQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737677; x=1733342477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNtWnaXZepM98YyIzvnlU9btgK8Sl+3I0wfijtbQqXU=;
        b=jvVjBU19s/zOImHynTI8gJYY5JMhnLKCnBCBPHetQYF8qbhLEsRNlliE3/WVxiDxap
         MgQ7K9/IoAaGb+o5APxwuPXmNjTLhj/FzepZVfOQYcaNk8NYVfD+aK2/iv5dnwOYGbd1
         VguWDTFASRVve2j3iFEPE3Ne2XGUXw4YOpvARIVaXupoLd+Qhmr6pUF7HENCM6YuuKom
         15AHrXJWTabOA3u3ITxn0rM7Mz3WH/c90bleYv5gr+kVXN64TsCkDRlUoEn+R9IgMi+J
         DGxX8P2Ivq0xy1RQwToP0fMG9hHJBzCnUbQv6FDsZgOh4BNbtYgD/BWJ8YF1lGb2n7Qg
         sSrw==
X-Forwarded-Encrypted: i=1; AJvYcCV2kiJuJjb6ud8U1thBOE7HJ/LEnLmxnfmse9NDt3lSKlGCk7iSJK1PaiBu/l0a6AXN98lEeAlxtgiKkas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDVHgcFwi+bQBoUal3fkd0FO+qF+nGTSk7H8TTYhgmpPP6Jjt
	R8eyMGkgv9A+hSIPJjHJnNWCft3j97JEziMClC/E7KGcIMIMQXhS
X-Gm-Gg: ASbGnct1VSkhacCsmlSBjUREZSsID3ZjOhTIeYbBzBamBmCU62d1fW7NMzBnBJDEF0p
	mBZvYHT4L/WU0+nMW5GoKHOu7r7qYXSiR6KPi8SPFMc6Z+fyn1jpTEZ8RRKTu1v9aidpCCNihAz
	I904YYLes2FZ5KKfJayMNuRj7G9kVwU+8Uk6vzyRphl3xfIb9RFz0WB2WDdgpq9KFff+EJe6Nex
	Hhot2cY3i8S9ZbAUcV6jTPJov0w/gxp0sCiwqMyQSmaRuNW63I=
X-Google-Smtp-Source: AGHT+IG+PIp2IbufA7SlTXsOkQs5BKL1ponxbq/foH22QfVBqovyNzaKNPCVft7uI/lQHtzoCJ/jOQ==
X-Received: by 2002:a05:6a00:230b:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-725301e3b2amr5598460b3a.26.1732737676803;
        Wed, 27 Nov 2024 12:01:16 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3fb34dsm10975608a12.78.2024.11.27.12.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:01:16 -0800 (PST)
Date: Wed, 27 Nov 2024 12:01:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3] Input: mpr121: Use
 devm_regulator_get_enable_read_voltage()
Message-ID: <Z0d6iUif-A8w7kSE@google.com>
References: <20241119-input-mpr121-regulator-get-enable-read-voltage-v3-1-1d8ee5c22f6c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-input-mpr121-regulator-get-enable-read-voltage-v3-1-1d8ee5c22f6c@baylibre.com>

On Tue, Nov 19, 2024 at 04:27:40PM -0600, David Lechner wrote:
> We can reduce boilerplate code by using
> devm_regulator_get_enable_read_voltage().
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Applied, thank you.

-- 
Dmitry

