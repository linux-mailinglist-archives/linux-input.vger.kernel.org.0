Return-Path: <linux-input+bounces-15471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F633BD89BE
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B5CAB3520B9
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789F2EBDD0;
	Tue, 14 Oct 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou9KGnGq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33AF2EBBBD
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435944; cv=none; b=N4aFuTWVkMqEmoVEOLGc8lLOQe8OO0Wuwj3jJY8MsljuKj0qxL9ot+5dnwfp+ETG5u3F2o5nPfM8oiOOuQkhmOCTUultUfU53bEp3C4TarDL5Z1WUeSyT+vrI0G9ZvM0NK/CNhMSV7p7UU7/MNsxHf50czsa7PjN3fxgCwj845M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435944; c=relaxed/simple;
	bh=xVE6p4LMwOTzVdS/ZpKgeRy6uhRD6B3Qd0HGKAW0deQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SwCI83lWfylMCLHT2IL6YfpcNIXSE4GqWHmIaP6x/1v+CGbNn4+s28ZBnlR4bk/GlTUvdRnsqYx9cNpwU20mmuVGaD3PBeRM+HgQYW5MefctuOly/eTxxnPbsn0vVYH/ze6zLq8uAFyx8KVdnGmyVKEPy1v7Eq4tfV0M81SVulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou9KGnGq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27289C113D0;
	Tue, 14 Oct 2025 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435944;
	bh=xVE6p4LMwOTzVdS/ZpKgeRy6uhRD6B3Qd0HGKAW0deQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ou9KGnGqfrM7JRrv5/8ZWEygkrBQq/3aAJEwsrNzXKMWhY6q1TIslx+qf5O8J9FR4
	 penU5Z8DdyFlUXYM8h6EFt11YsrVe91LA5yPT4GBmvna91purilDzPtgFixcP099N8
	 Pim1JC93wUepaKeuLmY8g01eo8XkqgIhLlV7XnLaEJDM3Ig3m4cB2OHoFeiE78p3lq
	 v1NjcOatQO6Jg5nXE1FYXivDCWUBONiEvMO60oCTX2187ZztHAG0+FFnu0M/X+Hl0h
	 SmhdcTAWCs/dBF7AlmLmVdj2FoFGS9sOcWnos0ZjKZeOVVAxvM6rv9RzF9wUd9nQ/x
	 wX6v7WaZedsog==
Date: Tue, 14 Oct 2025 11:59:01 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: core: Add printk_ratelimited variants to
 hid_warn() etc
In-Reply-To: <20251007010533.3777922-1-vi@endrift.com>
Message-ID: <o421n6op-poo4-nr54-n36p-237p544sp5nq@xreary.bet>
References: <20251007010533.3777922-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Applied all three to hid.git#for-6.18/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


