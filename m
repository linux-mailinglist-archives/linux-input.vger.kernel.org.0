Return-Path: <linux-input+bounces-5690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3E9575E6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 22:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60367284183
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AB9153BFC;
	Mon, 19 Aug 2024 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Psbnl4ie"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B015E96;
	Mon, 19 Aug 2024 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724100416; cv=none; b=Ma71o7pDuDycaoYeG7xFArZPzxjlAuXBswlKC4h/Svo7xhiUlMrsYaT42kq27Qc53kV0oIRmZ4gMmYWP9ScS77fhszKZCSwO3/TZN2Sb7GwTHSyIKAWtUOBcSwwHoq+DrfC9IBxgUn4Pfkr+Ml5iMF0fsqi/mqp3NbAGb+m4yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724100416; c=relaxed/simple;
	bh=9ID6PibeTn8fsSlhSWvU2oJMkUucVU6N+uOOeZ3Nd2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OdoMrEvznGv1zhi0JibWH5+tRpO6T1xQmxU68l5z3JrG87QD2JipB5wRNqGx8z0rSHQKsGE5PcXawuOzgYddMNZKy+tug318legnSlFHNa5BdGTNo3iczdu3a5q/8J2g/8zRByBoIWcM5yjXumzMKWzOcmnu1kYP41Y3KM5jZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Psbnl4ie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E05EC32782;
	Mon, 19 Aug 2024 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724100415;
	bh=9ID6PibeTn8fsSlhSWvU2oJMkUucVU6N+uOOeZ3Nd2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Psbnl4iee/jh0BkQmgNiF3VVqelUZBOBHwE7KJoBrOnVJFmuinWilUG78o4lJUwsA
	 WApnsU+nf28nsUUPEERz2kr6ZZ/AXdkPn3o0yDl2CCH/cOJJU+33nTtHHYUO98NOJr
	 qz84v9rfjdTWrYaRgq/L10a1d4UvU4DPWkSANSFex+mQ//reGJeFGgaf9lqhbvaM9/
	 O4VeuX1jKudeHaeaAtCznRj3P/yhvkrxJyY/OyIfP6NtIpHYJmXyXks60WoMocEem1
	 WSagAy+jOkcfgqDWJ5E2Q/FaSFz1Y3WYhUDVwT/Dlx7O8ecO093Hb7cSNnFjOOkPMH
	 6zUiktlY9MExA==
Date: Mon, 19 Aug 2024 22:46:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Roderick Colenbrander <thunderbird2k@gmail.com>
cc: Max Staudt <max@enpas.org>, 
    Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    nathaniel.lewis@sony.com
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar
 together
In-Reply-To: <CAEc3jaD7vnU_SZYqyAja6LD_Zqwy6cpi+yWOW94tPt3UH6vGqA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2408192246220.12664@cbobk.fhfr.pm>
References: <20240811130906.3682-1-max@enpas.org> <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com> <nycvar.YFH.7.76.2408192033080.12664@cbobk.fhfr.pm> <CAEc3jaD7vnU_SZYqyAja6LD_Zqwy6cpi+yWOW94tPt3UH6vGqA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Aug 2024, Roderick Colenbrander wrote:

> > > Hi Max,
> > >
> > > That looks like a reasonable workaround. I think it would be fine to
> > > add. We will try to support that with Android as well.
> >
> > Roderick, can I take this as your Acked-by:?
> 
> Consider it Acked-by.

Thanks. I was ->.<- this close to applying it, but apparently it's missing 
Max's signoff ...

-- 
Jiri Kosina
SUSE Labs


