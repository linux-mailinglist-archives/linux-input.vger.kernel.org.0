Return-Path: <linux-input+bounces-11298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB12A717A6
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 14:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4E21754F8
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 13:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21D1E1DE5;
	Wed, 26 Mar 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFl3hxgg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E471A0BDB;
	Wed, 26 Mar 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742996372; cv=none; b=eFII0J4zA0NowMqI1AOUT3NCzhx0lOrxvENwKK0/p0QPbRi8C88Dg2gNIh8DrfpqSceDqNgz6OtaS/UQHNdH7BYEZFWjDXPnWqyjS/QFPRpZhSnZqsG3UE5ynz+NFxZZ5d00U3ZqKFyHP1yeJiuuW+hKavZ0l4+7xQhYu8Ih9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742996372; c=relaxed/simple;
	bh=G+1bPq00pfcw5FfGpQnUUBW55ek4LCDQ4SLjYNHQC1U=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=kSF5iodjGxhEQEZzafBUWag3dtT8RTVjC6T93E/8aWPWgWL+QPtvvb76hydVRGKuEu4fnaK1OnYDd5jthF91IJncOUgs1RDXrd/y5mWEn0E3zrwg70tiFvFhckSTTaiH94JUEYXt4oO/+YxAk4XhwgjNUchfTbOUgNtmFwFh8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFl3hxgg; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so6561974276.1;
        Wed, 26 Mar 2025 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742996370; x=1743601170; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+1bPq00pfcw5FfGpQnUUBW55ek4LCDQ4SLjYNHQC1U=;
        b=nFl3hxgg4qtS8MhKp5uVKlhmZzxOFb7EjRHyA6uricrrz9KDIGLyRVOvH39GFdLVRn
         bHvSBoTL7wwtPweK6wzEx2Tw8C4eh5OdpNCbAccTLAO91jN8HhHiPTee0t0KmSMDma4h
         pwinCF+QAeTvXN/YarCQb+FVZnxf/rRlpdW8W5bVW8z929XJwcy3Lzr96M4SiQ1CkNAX
         oPZBgEvMGMZohHBPqDm2Oe1rtwb7P0V4LrbWw/JUIvgP7dJqU4FZV401/a62+MNXC9Jr
         I9ZEDOlu3qFv4huBO0UaeFvwyb6EymcGBJMqLpn2wgAEhuGa/o4i+jeEpbPp1fmgQouc
         84yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996370; x=1743601170;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+1bPq00pfcw5FfGpQnUUBW55ek4LCDQ4SLjYNHQC1U=;
        b=GV+mHxskOiDhtPmOHh+uf+Ptoeed0qfej9VSkKHSYrzOqsC++3H0SD5m3eHck6EiAN
         bdd2+SpjthsFmyIWFfExUPWdpd/vdp1rr0mwcfV2ySBqvm9laLvIRyzpYkPiEexODzaq
         kDYvzqEoJWL5ubAO9d5QxQgVwJ3DJtfbNCIq5NTTa9feG47+f6ra5E2kks+6mht+6GTz
         yTa6OTLi0/yCHox78DF+Br+5FzX/2YcvlyvekoSSFElJ9NFHFGfLlh2cgng6rG1ftzjx
         Ug/bSULGFGZDZ7uO7WwyYrLR3BDzuHD14WVNA+eEN3S9YgH7mNMUQ+YA6YIh9Rx7MoRy
         4ZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuIAtsjJsCRmhtwWWRYrg2++ky3sjwSiExsVFvJ2bFRDQO6r33YdRtNoqV4Bv0eA5bercyb7rcJZbgsMrY@vger.kernel.org, AJvYcCVfTf6mgowzB+W6B1jMZYZTTTmU6j5XtoVVLnMx3gqlBQnwUDHtUypNXUiWtkwd9p+MsDthTj7B8DFcqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz4NvPn5Z46Aa12O//62LMvpGy17x7f5nSU3wV9+1bPsdumLXV
	LqfDTgjULAYsDHvfHpx6QZfRvX5KcvjQbWy2vwQ1+y29VG9vN85oZsMT9dFE
X-Gm-Gg: ASbGncu/iU0vQL7iSA026smPey1uyvpYpI+6YXmcdZJBmooP5m0eRx1/IxmnytX6494
	sC0xOlynGbPez2se1DIfON5OXdkyuirVzViaVx+w+OGTAmtrZYKehLqTfNzhmoH1LVHa9vOaFJL
	ObYB53dzFOpi6MqVjLLzN+5u4+CC6VAinYbDESFQBP9asw1NX+PDDrXIuyRgT8ZJ+XkGaUeROp6
	/wImWtHyYeZk5v7zLiNywwzh/GcJS+YPq/u8HFPvMlm4quXapCYtxYZw8ibbmH5RHiZO+XMzztb
	zLPieq3cMUWe6oFG+CwtVqxsYolBFZX4B8vrswbSoO4Zq7r6CIyRt0HnIH7TqbLfTil6CIxkFjr
	f
X-Google-Smtp-Source: AGHT+IG86fcKoiR1bNMN+dvMrq8PLxwv5hDITg/IDjKGisvGVwDdZViNu+LxypbQ2NlHjGuuF8VcNQ==
X-Received: by 2002:a05:690c:c14:b0:700:a988:59dc with SMTP id 00721157ae682-700bad227e3mr277562707b3.31.1742996370017;
        Wed, 26 Mar 2025 06:39:30 -0700 (PDT)
Received: from smtpclient.apple ([2401:4900:5fb3:22d:130:8957:5645:7f3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba76cb4fsm25124437b3.43.2025.03.26.06.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:39:29 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <adityagarg1208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch Bar
Date: Wed, 26 Mar 2025 19:09:15 +0530
Message-Id: <CB167906-8D50-44AE-B873-DDEA9A370066@gmail.com>
References: <7rsn5334-npo6-408r-8442-6o3qo3qp05q7@xreary.bet>
Cc: Aditya Garg <gargaditya08@live.com>,
 Benjamin Tissoires <bentiss@kernel.org>, admin@kodeit.net,
 benjamin.tissoires@redhat.com, kekrby@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, orlandoch.dev@gmail.com
In-Reply-To: <7rsn5334-npo6-408r-8442-6o3qo3qp05q7@xreary.bet>
To: Jiri Kosina <jikos@kernel.org>
X-Mailer: iPad Mail (22D82)



> On 26 Mar 2025, at 3:24=E2=80=AFPM, Jiri Kosina <jikos@kernel.org> wrote:
>=20
> =EF=BB=BFOn Tue, 25 Mar 2025, Aditya Garg wrote:
>=20
>>>>> Yes I can move hid_find_field to the original location as well. But,
>>>>> I would not want to devm_kzalloc as well unnecessarily if the
>>>>> touchbar is in the basic mode instead of drm mode which will cause
>>>>> this -ENODEV to be executed right?
>>>>=20
>>>> It shouldn't matter. hid_core calls devres_open_group() before calling
>>>> .probe(), and calls devres_release_group() on failure. So yes, we'll
>>>> allocate a piece of memory and release it after, but it's not something=

>>>> uncommon.
>>>=20
>>> Fair. I'll send a v2
>>=20
>> I've sent a v2 from my gmail address. Outlook is being too fussy these
>> days, so hopefully I don't have to sign off twice using gmail as well as
>> outlook.
>=20
> Thanks. Please always make sure that either in the cover letter or in the
> individual patches you otline the differences between individual patch
> submissions.
>=20
Sorry about that. I recently switched to git send-email and it took time for=
 me to get familiar with it. Such minor mistakes do happen in such cases. In=
 case a v3 is needed, I'll share the Changelog. For v2 that I sent, changelo=
g is:

v2: keep parse at original location in patch 5 as suggested by Benjamin

