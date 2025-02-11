Return-Path: <linux-input+bounces-9944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FBA30BF7
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 13:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27BD57A1D62
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 12:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE93F21CFF7;
	Tue, 11 Feb 2025 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6D5gnal"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274A21519B;
	Tue, 11 Feb 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277910; cv=none; b=jer84MUdCfBi70Haa+WxYa8olmm92xi2eKK/jiqZz9YtTa1yaVv0Pa3moAmzNAVyTIx+OvGN+BWPrkzpEkWRgoTBYXAGPHt9iTI7/yegJ76vNpWNivkwxiB0cBz3vMGTqmlfih1iIQE+vH52hzkh19Z7vkTaOoFpeDlI81qdMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277910; c=relaxed/simple;
	bh=b7HSmhIpAStV0K8O8xxRkRgL49E4BBKqvqn+cB6+1sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoMerm4QDDOSBa2GDhIgPI8OGw5BtlFIa0PUvzTuw5HsHKxBJPuwFpLi6MbXt9sLtTp+rVBOc5BFMVIuHcl3Zp/XKgTX4sm17A+mWpIRZ7lhyYyR25L7d5bTR0fT/3JnPTPZJPtRVd+qunBAETCiKI+ctC8mOAu8ZSp6eVmTJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6D5gnal; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd935a267so2155263f8f.1;
        Tue, 11 Feb 2025 04:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739277907; x=1739882707; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7HSmhIpAStV0K8O8xxRkRgL49E4BBKqvqn+cB6+1sg=;
        b=N6D5gnalofHglrKmMdv2ysIURFlhaLwMGeWGIwmvXp8QrckSUyvpfoJj3jc/6V/8ho
         Rs6iE7MbrPxvgHtrI3BFEclnMtbPMEKLXqtcg88hBwbgzmIpuBEuoRxqk3ndF26b6w60
         A8xCkzVLvhXnnQDMZ+nozXT0q6brbu0OYtImhexQ0BCKaom4rag3E0QC9gzSeXxfDheG
         FUrv+wP1LiRx1ogbtpwZeuUY0tFu2xsqen8bJREt3sLFW38bshZbaCaZE4mZ59lgxhC+
         0XbOqNrlQx8HmNOhQjXvubYDrC1YDHnyKemR0qccOkINeUmqV85i4QpmCzgmI15s4qYU
         Dc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277907; x=1739882707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7HSmhIpAStV0K8O8xxRkRgL49E4BBKqvqn+cB6+1sg=;
        b=rDNvGJolPJSZAE/tGTqIsKg+FirzIsCoDrJpRsStYmpZSh5oIGDgfpdv2eHNJ09NiI
         buxjeskSLFXCajFkfJSN88MKxp7yf2RVGcA0lZA1Xps/4ZGVL5GaKJ47OByfoGsz61el
         1kYhgYBI3UFJzlLvl4yJi8MIzmIRNOJ+L/43avPakm7dVEbPgOyj8zecf76tLqrQsJNx
         lCX97lhFfF+Wi4Qg+oqfRpqoef+KuykbIirOgRKYH5VoL2dQac3U2ucVtLwl3GShazci
         L16atxHzAgyIxNA1zL5BvP6qdcCCKCMeonZ7796ndZ58VQN/cn91XbSjL3L06PYtBZTD
         xjMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAI3mxHIqhbCX8JoLKAm7v6smofvY9KxeH5MMLMAZ06dxGZ/QJpi2poQ+Xc1LoWWwKuh+o3uOdkJRWGvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHGIRFVShMAYXfFrnGD+0YZG2qajNhrJka9XmjZMFeqf1TLFU
	yI/wbLqaiNaOIfB6yNXvT8/lI8BBAVXXf1xw38uHqJt6oC3mCuBAdh658UXjFUoKlBnYg3yhTDa
	kcMCZTHTRA5BLk6+fTnJ553rhR0MjKNPkkp8=
X-Gm-Gg: ASbGncvh1pLSIO5Er0QBbjyC2lGNEVtt3+clw4NPUT58iIUzYSusuMIxgaNWU3hilK+
	H3FlpZ5am4SreNa4O0zHSIZFDR+s7wyPgNHBmMBDQOCfKnQVJBBG/L3QqvqUW9m1w6u8hxEpevQ
	==
X-Google-Smtp-Source: AGHT+IFUOc1ufCjMOlUoqKX8as3xc8OV4P8/UavVxfyrkn+hfn7jvx1EDOOxVc54UsWn3TVnwXOQRK5DgwT6DTBKpIk=
X-Received: by 2002:a05:6000:2cd:b0:38d:dbbc:3b04 with SMTP id
 ffacd0b85a97d-38ddbbc3d7cmr8049197f8f.5.1739277906921; Tue, 11 Feb 2025
 04:45:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
 <5cf187db-1eae-41a8-a33e-ef68a4f66db6@kernel.org> <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
 <CALTg27kaxGOzq2k-dAqbXZ0ez5e-WZRU47Z2eP5297VVHF81kA@mail.gmail.com>
 <0bc098bf-6c02-4d62-bcb1-939e1f0b9f95@kernel.org> <CALTg27meqwVyR_+doDzT6v-frx9hfy=fqkz-S2fTJpk8SMmThw@mail.gmail.com>
 <373c2d57-a513-4c2a-ae38-1aa01262c197@kernel.org> <CALTg27mhZ_O5=Q5QwmtAbFuz+phcmt7nVfJo7OAUcvCvDu9ggA@mail.gmail.com>
 <8b27c399-098c-48b7-b71d-a833594571af@kernel.org> <CALTg27mzuJsvrQneDKD9ni=tYspaap7=NfLgsBak4hALu+1jzw@mail.gmail.com>
 <183b2a4e-d8bb-454f-8ac7-f74ca9d56269@kernel.org>
In-Reply-To: <183b2a4e-d8bb-454f-8ac7-f74ca9d56269@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 11 Feb 2025 12:44:55 +0000
X-Gm-Features: AWEUYZmy0XPTi1uPBjF7Z4wHZtJPyFaGKP5rTthza2uoSo2yFIlix6E1pVImjMg
Message-ID: <CALTg27nUpWtXDkkSW1yF6Z1K=erFGPOor0kM4xJ08iwkOZyOQg@mail.gmail.com>
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It's a single work, it cannot run twice.

Ok, thanks

> E.g. set_bit() (one bit per OP) to something like 'unsigned long flags'
> in 'struct corsair_void_drvdata'. But it depends if you want to preserve
> order of actions... (Which was not guaranteed with separate queues
> anyway, so I assume not?)

Wouldn't using one variable for the flags risk overwriting each other, unless
it was atomic? I might be misunderstanding, I haven't played with the kernel's
work much.

Yeah I wasn't worried about the order, since add and remove can't fire that
close to each other anyway.

