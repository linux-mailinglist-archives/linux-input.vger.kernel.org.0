Return-Path: <linux-input+bounces-15589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F1CBEC7D4
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CFC3B7F6A
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 04:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729A2230BE9;
	Sat, 18 Oct 2025 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLZVWjEV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5910A1E
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760763035; cv=none; b=ZZvMBJ5JBmAA2vfcWnzloxZo50/MwWHbymTultmSir3CW2m3dOGU9NT1EcEE1wJnL3oN6keJ5H/dVb7T5k++XIIrpoVaN2T5jgpTWHWeVgWBE6NLk/TS8Kx3P2bN9eaqScG+F1kA9PwqXUmv/xvr+mInO1yAwGIG8ctZyRTnBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760763035; c=relaxed/simple;
	bh=k4F1HHaAuhImo4Rj3lkcJWOnbRZXj2OebT2TeychcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y72+wBvIWksFC9ndTbVmue/ALXnyNLidW+X0qIx4VQ3ipcWMdDoQltrPg65X+NZrcXVMQi3g2nF05lAUPI0PgV2/LiYSSYVm3HjqYEOP80jZ1Pe8CHV2pj3SebuBNYmMiPCWg9qwtJ3j87+Wb3l504/yfqFIEb1VSpAHPV/FJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLZVWjEV; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so1775612a12.0
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 21:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760763033; x=1761367833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0sMcbjnxJjL/lB/sP+Eamk3VovoERZKocwwc1E/DhY=;
        b=gLZVWjEVInaFy/fHqejlqgq35+i3eIK6Zkya/wIYtLtEhNP8S51glb/dAFwyi0uh2k
         oSDCK4A38QLGWJ4i/A53s3oZWHUt+eu6A3m9TguYTNUIlb4/5scdV0/TAcY6C48ZKnGD
         WDYMYEp8WQ2hNt2X4fg/fuvVH+/4ldgLppsSEYpAKz/vNnAZAlP5kq7mjg+TOuR5qr9Z
         FDrQv1pgnQ5/uFoCUfrvWVKpNoNHZhaxBUEAba7zX29/2pGH2IPkA7bkXo/WmKjHp+Km
         ia6/VfIsQqeI2Zx0gqwe/ZUGQqZk95ves9/wHU9MCZ5b1t3slIJ5dFpCLFaz4FMEs4Ri
         mxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760763033; x=1761367833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0sMcbjnxJjL/lB/sP+Eamk3VovoERZKocwwc1E/DhY=;
        b=Q1YjkxtnHRKHlQBOouhZwm41v5LP2uT+BriYy9zq5GteQ0lLtD9iLhsrWcQwwCRJTr
         WTJ8jxjo04KcyoJsBafbW67Oxfe8mGTvW7PcSlvbty9XnjCWSdal9OJhrXx3yGJv5ZRD
         BnW7E8ljMefQZONIneX0OUbosuyFTjmWIyApakBbTiFxRuwF4kzAPqD1dxk7bL1XeIgg
         6Y9UZlAR/zfrCPWeJjV65f0pfNKFVf64lUqdXq+REaW59zxZ+OpXWiWdZAxIdlohhoMD
         AFVPhBk8oq+Fk9KRFbocFh3Z8VzA9C3fgi3sW+DQ848StGX70eXL0mqPP0aQk0IGJAIq
         V+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU0CeGaeluNpC67gseKHuC4FhcaYdQyhxI876p5rDI8WMqKOQbfqyWOn+GTzUb7KD2uraLgh8A8wuialg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCvxx1RcuipDIJ5xdVL1Mdf3MBkQkrifl5xxnSQs7gs6qlq8L
	nneLPKqsR9k4rt6e7rju0mFBoeDPnXSdTve2d7/JHnNIzPqEY0FfveVN
X-Gm-Gg: ASbGnctuhZ8bK2xB120fjmBUUUmjitgwGyyqrXl7bEeD66lPk4bLrN2CE/pP1yzAnzJ
	DovNk0GatJOIPL0OHNLWDeWj7Otz7RIWMPw+xVJMdc/cgesUv3jWzEcQAA6o6+7CKPc2paHD6ni
	ABFkZ26oVvvxanPleQ7UgBAnClC0anc3cAzU/oxBqlN2lzR4AxlwvnrDv/jTvRDUWilAlhtXESW
	vgdStA0Agy6yhLLHqHHN5SS2XJGeKDFCmMUqKgpNgquWKGsi0XNctSzXuPURUJ1H3LIz5fKV9sM
	bIeN4c/cqnGFkFlSsJIrXva4hxLHwTberqsqcfB+WGVndmK7/F4YKo/4hL4fK0mWv+S8hdFUO9j
	LvEi0taHV1LRa+Jx3Bxnyb+z2KkdQ0FKuEy54UspN432NObqSxnaUwtzW4590Rhrzff+Xdmvc83
	vZQZS1qDTCL7zuM9wh6RSHQXtfgb/dkWFR9J+vNvfy
X-Google-Smtp-Source: AGHT+IHMjoy3JYX0GIA0YqODQYkO7XpyCQFTI62FYZAFiPaOqOChaluABKwmRhz9RmejVfOVQ4yQKA==
X-Received: by 2002:a17:902:cf0b:b0:269:4759:904b with SMTP id d9443c01a7336-290ccacf11dmr76359905ad.58.1760763033380;
        Fri, 17 Oct 2025 21:50:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf06sm12900515ad.24.2025.10.17.21.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:50:32 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:50:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	peter.ujfalusi@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v4] input: dt-bindings: ti,twl4030-keypad: convert to DT
 schema
Message-ID: <6v45x6qq5onrmpjtfuyow4sokbchek6nul75neqvj6jhu7sf7j@a3qbgsl72ncy>
References: <20250819222823.157943-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819222823.157943-1-jihed.chaibi.dev@gmail.com>

On Wed, Aug 20, 2025 at 12:28:23AM +0200, Jihed Chaibi wrote:
> Convert the legacy TXT binding for the TWL4030 keypad module
> to the modern YAML DT schema format. This adds formal validation
> and improves documentation by inheriting from the matrix-keymap schema.
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 

Applied, thank you.

-- 
Dmitry

