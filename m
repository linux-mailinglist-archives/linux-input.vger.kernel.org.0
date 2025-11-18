Return-Path: <linux-input+bounces-16170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8446C680D7
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 08:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BB7235D759
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 07:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A521930597C;
	Tue, 18 Nov 2025 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od+ejNtr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252EA301483
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451491; cv=none; b=lZQEp3fURZK2lypm0bXzjjfI5iNJu3IP+8VPvLTfJoTx9CReRPB5cO5eqTNcPPmbfSyxBz4+SZcgTn36v1aEskn+dpRUQYHYZGRP5zHu8MUkv9rk+UJ4m0jVr5v12XsznfgwR7oli5w4gAFLbCRGTvAo2MRu9R5kLacOdgU/QKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451491; c=relaxed/simple;
	bh=TH7NeO7vVQ/VUG2+FEeNWkKgZ2KsQAIwDaSHjhp/tv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d22uIs/a9KXG3TvlHZ37jXZrLvB62dFKdPPRLwJsBWAHwG+gpd1NiShM8ib37QOAl5Xt3eAsqpFeZhUSP+yvFtUJVDW5FGMDNbC+WA6v+VIe47OMHqYTm+Y/pgGzgpqN/LqZ3klHFtnmqZIbbAHjGEyzsIyD0IjRwQRELfHSXnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od+ejNtr; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1291519a12.0
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 23:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763451489; x=1764056289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oP6aqnAmldvD/TQWtFvRxy+Wad2q25rZrlIi47Pmepk=;
        b=Od+ejNtr3eoNuA6emZKmQSynTYrp8pstmcCLUkrqP6sXvzfLkuUdONqXvWmBQDwHWk
         EVsHDi812z8KKdu5+AJ822ysa8P0xkKPnPoSjLU8sECeUNyyrvz0mNjz4cN4oWwRwbQZ
         BlPWmMtQYdGN1CGwpjq19iyZWRa1TC20OuZ6TrhLmMRfvny9fqOcrlwT09VCExBxjaEp
         Up5Vd1Kq0T43w/g8EQ6U1w9aPDGqULWXHcPa7ECqCKEqkzL8BSGC5Bh6aZ5XVIm3VrSQ
         KBNQZVNtXr/Ncb8ECy6iz6xssRbfUXYUvSaMcsIYqpMDLVBuO0EDg0UgtSBgK7Xs1SmO
         R9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451489; x=1764056289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6aqnAmldvD/TQWtFvRxy+Wad2q25rZrlIi47Pmepk=;
        b=i0eYk2ondQa1ExZVT/FH0Hy48r8lh/cqgJYLA0r26vMI5KAoGsSHKgEQiqDUa76UYU
         d+PeDuO9TCfLPMF93ftZ3slW4ibjQh1woY0FEQhBHEjzxzGrygJjMGs5seEJ5zU22CPT
         y2LeT9fLbgXtprg4ThDGut+lQHu1aIK4EHiV/YoC4SHitAbTsomymEe0wPQV1xBDPEYq
         MOaxCKGFfCe/6DjV61q2Fg7VyimpjOUKcg9V9Sremf7IwMiM5ebuR8kf23ZRzbjqvSwL
         OvSGbaS4VdzPL3TyT2NUJyl7VFGrWsDfEcv2pP1qqLbHKcPwbUIdWnt8GyDcvTaIs2Eh
         8J/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOdhH9YzJzwuWvxWtNu2Q/0U6LKDXScFDtlDuosYiY3/VIzK8DdYB1OmibV8/Aoq656XfVd2MG742qMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9T6vKxPrcTF1nkp9dlD/c75Ndk4spPREJtblk0MQ0lXFAnbIE
	uHX3zdqR3SxAU0XCanB/LL8X29BGrVvLN8/5azvKzpAEk5WoawZsKj7v
X-Gm-Gg: ASbGncui2n535TcXDugsS2Pl+91QOAIQuOVjR+x9BsrUC6f82z/y8AfFpdASP5BeMt0
	+Lrm3QojhMIgexhZcUiPBsWoc6fqhRxHk75t69cFuNmUvWzRKJljhX8Xp7s0Shxa5Bd4f9jZFeV
	leGlLb9jCRy5xGYN7h+Rg+/7SzYANVTCWWy2SFu2jiT5vR0wlnAvWiJh9PCsOvjShs+JyJODkCQ
	j5YihcTBgsddZXfy6Mf2WP7mP6OFj2ttlj4Wl9m9EpQGdJLfOOHbY2D/MS5P69P9ZKAbAVR3U/u
	9lL6f0evUktj+2qBLsXUpmJ6Zer/cGxzaZUA8HUuUxWT9iA7SanRN+MS/zcnXvbb7eJ/uTzpCLa
	IX4dS4sOTI18XEFHSrvug4XpmFXIxEvLbONsNO0JNtzTVPNLQ6+ctLim9kBtL4PjUfhfmseIqpX
	rAkLQT3O4orV4A3bjwmc9cLemBVuZ1wEo5WldrPWEritbyaA3s1kfn
X-Google-Smtp-Source: AGHT+IHtH29nUNBPA/lBB5oFVu9GhAwTUs/IjNh//vDlVAFByzmjZi0X/4i0dn30KDz6KOOS0/ffmw==
X-Received: by 2002:a05:7022:662a:b0:11a:e425:deaf with SMTP id a92af1059eb24-11b41406578mr6273847c88.26.1763451489063;
        Mon, 17 Nov 2025 23:38:09 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db7a753sm54607139eec.6.2025.11.17.23.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:38:08 -0800 (PST)
Date: Mon, 17 Nov 2025 23:38:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <2khyn7qnwphg6hinptwsfs3xnn64nsitebja3sqnolceopwylg@mqrq3duv3nel>
References: <20251030011735.GA969565@quokka>
 <20251106114534.GA405512@tassie>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106114534.GA405512@tassie>

On Thu, Nov 06, 2025 at 09:45:34PM +1000, Peter Hutterer wrote:
> And expand it to encompass all pressure pads.
> 
> Definition: "pressure pad" as used here as includes all touchpads that
> use physical pressure to convert to click, without physical hinges. Also
> called haptic touchpads in general parlance, Synaptics calls them
> ForcePads.
> 
> Most (all?) pressure pads are currently advertised as
> INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> commit 20ccc8dd38a3 ("Documentation: input: define
> ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> provide this information.
> 
> In userspace it's thus impossible to determine whether a device is a
> true pressure pad (pressure equals pressure) or a normal clickpad with
> (pressure equals finger size).
> 
> Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> have support for userspace-controlled effects. Let's expand and rename
> that definition to include all pressure pad touchpads since those that
> do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD
> - pressurepad with configurable haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD + FF_HAPTIC
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

Applied, thank you.

-- 
Dmitry

