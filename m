Return-Path: <linux-input+bounces-12261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E6AB26CB
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 07:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96333B573A
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 05:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D1626ADD;
	Sun, 11 May 2025 05:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru8v98lh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7302B28682
	for <linux-input@vger.kernel.org>; Sun, 11 May 2025 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941934; cv=none; b=aWO5DFsSo0XdlxQPH22LRqahaqQU0qexv+BgJm7ztqAe2KMGPb02oihFbRujmhC2bvNH7H8KU+WatD3ZWB72vvNumAkuE8SCsigW/vCjLfe2rpHBP6g05phVK0ktbY54IEkoXeU7gstrNM+uaN72tbc+onwHG122qul69HzNBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941934; c=relaxed/simple;
	bh=9nBafPfrygQcKdlJD86X/TvgfllTlKr/ocNRinkk7H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVc0fRrlRA8vweZxtbmE7j7Tp3/oJNaqJGv9fCweYglOTeBTJJvg2kHrvm+1q1Y7/ZYb6nduwyqP/GCjZ8VtjlUWWgeVOL9g/RX+5BOoV2QVnZkpBHMmUTQiAZ8exiIA6JW9kZ6rbcFU6L0+Uut77rwSfta0pfdH/zwYIXscSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru8v98lh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3376280b3a.2
        for <linux-input@vger.kernel.org>; Sat, 10 May 2025 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746941933; x=1747546733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IwB53vBYXYIfk7C14TfkKqfe7OR3WT5kwbrSwws62E=;
        b=Ru8v98lhtlKs0AnNWzfqa79ElQNI5VblRq7M99jslOsoXsZF5OAyE5EXFXN/2JAmyd
         kn66g+00m6U1CjnG0JRi3SUbXrt3+elzhiC+07umu7NvczS704Zs1wLnbF26paKz+6di
         XCRkqhMzcxsmT9deTDpa8BBrAVb/2AywmGHVZ76hZtV4mJ2KwtOTEtzSpWW33f9JwfK3
         aNVmCdYmXgDtdxBTVdeqhXaQRrBl6XTiKiaFCY9+yeocp2cyeA039NRDkpITm9/XmVr+
         Loc9sWu8bFcuPJUXSMq5bROsg1C0fokkXRfMZfkDTffc4mR1RberUeXOAHS5Ii3BqeSO
         sp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746941933; x=1747546733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IwB53vBYXYIfk7C14TfkKqfe7OR3WT5kwbrSwws62E=;
        b=sstb/tpytInyl2BzApS9DtXuSPgP2+DKekxcJF83ImFgeP7ewRvg2ZvIRk+BUIa0Ay
         ppRJFpXPvnWtIa9kgrrl4hVsz4SDHQ/zeqjk7EyrYPGAEcUCkPzjz/qRjJ3wN4XX1ZTD
         Zpd4KZr/DleLHM8w/miyygo2O+RPT2Z1vvHq/B+YYWDdv0wKwTUDRM0oE3UVB36kmLfu
         Ny7PxgfWsHEOG5zNop5TIWlosoljkB6aJw6vGypcqqrXeeOVfxXtzK8JlGTbrlNQhKTh
         xFQ7oSV8ObL6Y7l3I7HJpP3BPtfDuqzfxBJEb8MVXrUENoWi8OrJ4W79SmUFZe/j7P8q
         ogfQ==
X-Gm-Message-State: AOJu0Ywgh0kJ9HNrYKCc8ZPYnWHW9X0mT/iT/hHz4Y2oho1d9Zk+LbP5
	eeKqsmM0S2yHUh7RrofexUBGo1YMaH1g9i8l6PoOGUp2uhzBILD2
X-Gm-Gg: ASbGncvL3dV+AgAo/od8UD5/uNJTGFO7bt0oRg4vJdA4Kq8u681eDUyddYiLrdjGW44
	q5Wq8LXU5xl8Y0KWM/I/QMWFMsTS7VeSRbNrK6xCgng9rBRmqcUIbMmmv1E+ILc1XcVhqJrvu0T
	Vd8n1w/lZvx2Igj/f1DCzAseQwDZcJX0IX4oE5i8iOooDv6ss/NdxqvT0r27/umpr8nzgFpCQFG
	/EO7XzdFQTx6L7/C+eUQxAFniV53HvVdCg3yibQKC0DCJBS0cCdmVEApAUM2LuNqg7J27o0SJc8
	THW/WI/LO7eClBZu/gcf2kfYk1JX8wUZNbq0AYMzzGFsdvkMk7TA
X-Google-Smtp-Source: AGHT+IGzWBGOCWoMb2k0gZ231TD7b3EIGtlIUz7k1D3FHcFPPPe2UBaYXr87+sZyP+ECOUcpsYlcWg==
X-Received: by 2002:a05:6a00:2313:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-7423be711famr11287068b3a.9.1746941932622;
        Sat, 10 May 2025 22:38:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81cd:844c:3bd7:4808])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234af2c287sm3110936a12.41.2025.05.10.22.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 22:38:52 -0700 (PDT)
Date: Sat, 10 May 2025 22:38:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: xpad - Fix Share button on Xbox One
 controllers
Message-ID: <izov3aimoftouojv7f7sklv22zvnkprd5ytnnbyyzoftpcmqmj@5xlkoxs4atbi>
References: <20250328234345.989761-1-vi@endrift.com>
 <20250328234345.989761-2-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328234345.989761-2-vi@endrift.com>

On Fri, Mar 28, 2025 at 04:43:37PM -0700, Vicki Pfau wrote:
> The Share button, if present, is always one of two offsets from the end of the
> file, depending on the presence of a specific interface. As we lack parsing for
> the identify packet we can't automatically determine the presence of that
> interface, but we can hardcode which of these offsets is correct for a given
> controller.
> 
> More controllers are probably fixable by adding the MAP_SHARE_BUTTON in the
> future, but for now I only added the ones that I have the ability to test
> directly.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

