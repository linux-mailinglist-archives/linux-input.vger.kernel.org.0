Return-Path: <linux-input+bounces-6426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49C9751CB
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 14:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049581F23BF7
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B901922CA;
	Wed, 11 Sep 2024 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHjUVeCc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8A1885B8;
	Wed, 11 Sep 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057133; cv=none; b=dIGx1qwAO9B6lIJab+wjEt7Wj1Y4kIy4+BBhQsXV+q1oOX7h0WmwX+MdormU5rKVFSYmH88uGllIkJgGN0j5oHYmmtsTy6X/FWAb4wcJORj5njLqEkKgdDGhHiGnGd3XbvE4Vlkp673mS61YbQlf+Xl56iy4P9f2aq1D9aGx9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057133; c=relaxed/simple;
	bh=2Gd4IyOlJRLGKPqYuFtiJOzroEND9FKTMoC/fAjNs10=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VlB4R1kagXv8ti4/nvF885bhXJtAB6x9mzbfSYPHFClJqwVbHiR96UDn0OJb8zko2zbPL5VUJbtA7ckFos2acgxBnK8qK3cvGz50u44hEA3Ohz1pi9Dd5EaPLOKTsvSMOLiTFTj00r30iJsRtKXX1QmWdtDPXcwNngokiYWhi5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHjUVeCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3B5C4CEC5;
	Wed, 11 Sep 2024 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726057132;
	bh=2Gd4IyOlJRLGKPqYuFtiJOzroEND9FKTMoC/fAjNs10=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RHjUVeCcSWR8KI+jzQfY6KRKbhenKgJMkSLASfMem5nZjbvjoZ7ptQ7OQQO/+CIsj
	 zvHdbUcMp5HK+F3scynrmiyLTpPAfZAKdYXdWrvXKKaapHtlVEx2TzhqbZSpzKj7G+
	 qXl6khXqyKD8ZYMfQ0oIt5SU68r7gzPkGBkPRVzzrfJiYidsNTaxhO5lXQXkPVSgEi
	 TqNY5xMhUUhS1qIQXk1GH+UFb176Ky4U0+WJ2HneJtiPw8k+WIDDamaRQ8UZ245q4S
	 gHxMAQK3wuLXBoZK1sc9q08nH3qrLFyqytjjeffMlb2WwDOriGCwKRpHbcLgPTqgLa
	 IuMBFSLOOfmyQ==
Date: Wed, 11 Sep 2024 14:18:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
    vsankar@lenovo.com
Subject: Re: [PATCH] Adding Support for Thinkpad X12 Gen 2 Kbd Portfolio with
 0x61AE as PID
In-Reply-To: <CABxCQKtfFttYVpfZE0jsjt=xgO4EJ0vNeb4Wf-==xOr3XnKnxQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2409111418330.31206@cbobk.fhfr.pm>
References: <20240818072729.33511-1-vishnuocv@gmail.com> <CABxCQKtfFttYVpfZE0jsjt=xgO4EJ0vNeb4Wf-==xOr3XnKnxQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Vishnu Sankar wrote:

> Do we have any feedback or comments about this patch?

Sorry, this slipped in between cracks.

Now applied, thanks.

-- 
Jiri Kosina
SUSE Labs


