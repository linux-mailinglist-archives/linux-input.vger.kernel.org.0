Return-Path: <linux-input+bounces-9832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61CA2C2A8
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6CFE1885462
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 12:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2291E0DE5;
	Fri,  7 Feb 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gD2kFNcA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594651E00BF
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931233; cv=none; b=qADLtj7oatgiMeMtg6VNv1Yq07a04nQ7XgEryTF5J/+XRkt+HMLLJOZ56sY8v1iKD97+rVN9b9PprHTPtVUz7o5lwfQ4OLrEj+U4CpzO3i44Mc6ZXQfwsi1CrHC9C15d7u+KJsXtqyx+MlQlvTmbrrNYxPhFbg8ZqxJaeBff3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931233; c=relaxed/simple;
	bh=QNipGMEXW591XYY0asYUe0WreL4VCjNs0vJXbysNy4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XDVqFKJB9zs8VP1UpvnfDGrFVWEeZe88S3bj+4HVl9qaUOaUUU8xmLwXtzYgjeA+ylqUIDbuCZoTx6cqh9JIy5XoixRvm6Q6BRzThLMs2fHizghOnQmvmx2QJ9owzbX6sJlZPDD66DthD1S4rspgbCqM6hhAzwrQ0FaZityN66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gD2kFNcA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709F8C4CED1;
	Fri,  7 Feb 2025 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738931232;
	bh=QNipGMEXW591XYY0asYUe0WreL4VCjNs0vJXbysNy4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gD2kFNcAYMjFBf9B4aCHCaQs2Y3wdJtjeJQLtUCiRyD8+mVQxoQq5nyPMfKqrjhcU
	 1hW4aXjNzHjqOTvyuKzCN6R4sxuP5uVKq0x4TpdYlDi/ZMUog4wF7QPjx+a6m6GR7q
	 ZSKwzq5e7esqNRuYBSLE5XvkVMcjQL404mPN8jE1b1I+13S/mbc48dcQgqNN5XgQd4
	 f0igsaqKB4J/KxslCxOvV7F+5QLF52K8ndCBc+S3yq3VIcv5C2QfgwYpvXetsWmmXs
	 BC72tQDQrG1FtFfcLTkEjF/T+YkNVQHpDSRQ5ZtWnRkpDvM6D5TqyvdV3EXmaOsb15
	 g+VXAnyarMkSw==
Date: Fri, 7 Feb 2025 13:27:10 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Roderick Colenbrander <thunderbird2k@gmail.com>
cc: Alex Henrie <dhenrale@amazon.com>, roderick@gaikai.com, 
    roderick.colenbrander@sony.com, linux-input@vger.kernel.org, 
    alexhenrie24@gmail.com
Subject: Re: [PATCH] HID: Enable playstation driver independently of sony
 driver
In-Reply-To: <1o20q453-5qop-52r6-ro2s-on09q503p3sr@xreary.bet>
Message-ID: <0848r6p4-9npp-nspn-86o9-9s8n7p9q9pn9@xreary.bet>
References: <20250205202532.2586-1-dhenrale@amazon.com> <CAEc3jaDtBwBdH2sqMFqR+0C+GeNJ5-p0JB7ruxwfmnB9CnfuZg@mail.gmail.com> <1o20q453-5qop-52r6-ro2s-on09q503p3sr@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, Jiri Kosina wrote:

> On Wed, 5 Feb 2025, Roderick Colenbrander wrote:
> 
> > Hi Alex,
> > 
> > The change in general looks good to me. It had been an oversight.
> > While add it, I guess also include the PS5 controllers in that list as
> > well.
> 
> Can I take this as your
> 
> 	Acked-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
> ? I can do the PS5 change myself on top.

Nevermind, I see now that Alex sent that one as a followup already. Can I 
stick your Ack above to both of them, then?

Thanks,

-- 
Jiri Kosina
SUSE Labs


