Return-Path: <linux-input+bounces-358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5B7FFBEA
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 21:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E82B7281995
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 20:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2594053E06;
	Thu, 30 Nov 2023 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ahb+yWNS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF59010D1;
	Thu, 30 Nov 2023 12:04:07 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cde11fb647so1352389b3a.1;
        Thu, 30 Nov 2023 12:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701374647; x=1701979447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1PqvmjbjG7ykJL4JwIFBXR63eHhHL1dA03iPSsFySA=;
        b=Ahb+yWNSbORuwyorR5XUZh3QuAuYD1NxQQ0HeKzY5zbC5Tc2ljV/6/4bxY7VWCywqf
         nIc8atCGdNDR7Ph8MqyHorHkEd/5LDJweTNCk7CL/P0by9hrPMaivJOMPua3BQY3n6cf
         +ryvHz0mcX8Cal1cVORfVWunWvqnvyHPzUgxxJS14+ygD+jIZAxYb4m1YXSJJmzUglRa
         ECC1w/0092OYRh3o4qu/el1JD0F0c7cxUEltSmlKB9qPmxtTZGq1PZZNf8AIOQwuN9dX
         F46QIRInvyUTmqfVVBWfzGBSU2aMYgOzcw08uMVbMO/H2mflEw5iWaar9Y5mFQzNaMQb
         DGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374647; x=1701979447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1PqvmjbjG7ykJL4JwIFBXR63eHhHL1dA03iPSsFySA=;
        b=pLETJ2Vvm2/+pXaNEeDC6CmTFX1tpdn5qIbqm2j2glmC1VmBkw5plqK0mqAvmHqJSm
         9LgC7V5DSUCBYag+YtVsHmr+YRdc5G5oG90K6GRJSIXXv+IrtFbkH4RZ8rD7XY9TmNYt
         5u00/dM/RWbJNrWK/U/TCUT0/bwTDbcX34dDIpuxxXLGrrsjgQAnh+8F+vDchsvoK4LG
         XAh3tcRCl269FCPO+7s+flVu0L7hizXn7jrXLRBtPNQVMPznxouRD3tc4zlYcigQlpLl
         dR2V2ebys5zigy7Agw9TWm0MEpr9FSuRsUCeSF9bdO0FOPXAIgxLphb/6sfx+9Jzit6y
         sobw==
X-Gm-Message-State: AOJu0Yx3m0N6UK8eMOkF8zZLt878JQoalIpzdIulMh5FlfiIZ6/HuVRg
	EtjC5L6E6p8idXh6yyUdVA0=
X-Google-Smtp-Source: AGHT+IGSU4kyI6HVBJCtFk94/IFEQnVwQTXcvO/ANs4OXKB8r8sIbrouZN5nLd+MrFlIKiykCTmbNw==
X-Received: by 2002:a05:6a20:3941:b0:18d:d16:e86 with SMTP id r1-20020a056a20394100b0018d0d160e86mr6475867pzg.59.1701374647242;
        Thu, 30 Nov 2023 12:04:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:aab7:ef34:dd65:27fe])
        by smtp.gmail.com with ESMTPSA id h17-20020aa79f51000000b006c5da6411b9sm1593213pfr.101.2023.11.30.12.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:04:06 -0800 (PST)
Date: Thu, 30 Nov 2023 12:04:04 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Esther Shimanovich <eshimanovich@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Denose <jdenose@chromium.org>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v2] Input: i8042 - add nomux quirk for Acer P459-G2-M
Message-ID: <ZWjqtFVfpE701W3M@google.com>
References: <20231130195615.v2.1.Ibe78a9df97ecd18dc227a5cff67d3029631d9c11@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130195615.v2.1.Ibe78a9df97ecd18dc227a5cff67d3029631d9c11@changeid>

On Thu, Nov 30, 2023 at 07:56:19PM +0000, Esther Shimanovich wrote:
> After the laptop lid is opened, and the device resumes from S3 deep
> sleep, if the user presses a keyboard key while the screen is still black,
> the mouse and keyboard become unusable.
> 
> Enabling this quirk prevents this behavior from occurring.
> 
> Signed-off-by: Esther Shimanovich <eshimanovich@chromium.org>

Applied, thank you.

-- 
Dmitry

