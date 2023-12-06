Return-Path: <linux-input+bounces-521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60B8069AA
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 09:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189B62819F8
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 08:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D4B1A719;
	Wed,  6 Dec 2023 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBsNO6xm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9C1A717
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 08:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EF8C433C8;
	Wed,  6 Dec 2023 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701851521;
	bh=l7NTcKKVbMNA+DHwOljfqAe9rXQOIUpPsR0EL1lWk3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CBsNO6xmKGoGlOSO11K3n3fF/w/jLhq9yAaZHNsQpuA4hr4tYF5oXwDnB52UV4mJ/
	 +q1eyeuT2a/PYfsSJ9XTGtEdpmHojfbfp0nB8WVaAq+Ib34XEx4xIXfUOvDmVbKwJR
	 t9PX78G72aUsI+ESM87BhNLN5Iwttug42BYOtX6UDjDdYJI0vCVQfOcL2SqKnOHHYp
	 FkYUOYwwjSCuQ3VD2n+wi4uThTw/zuc3n9gv/55AGwkZejjEwr50d9YwjEd3btejua
	 6FWQYte2VyeRNMtqvP2Kl985piOmf1jzkSUJXR0JIU+DK86Mvzh9DyKun3S3RlROwl
	 Xgf57wOMyrYBw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-input@vger.kernel.org, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Jiri Kosina <jikos@kernel.org>, 
 Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>, Jason Gerecke <killertofu@gmail.com>, 
 Aaron Armstrong Skomra <skomra@gmail.com>, 
 Joshua Dickens <Joshua@Joshua-Dickens.com>, 
 Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
 Jason Gerecke <Jason.Gerecke@wacom.com>, 
 Aaron Skomra <aaron.skomra@wacom.com>, 
 Josh Dickens <joshua.dickens@wacom.com>
In-Reply-To: <20231114235729.6867-1-tatsunosuke.wacom@gmail.com>
References: <20231114235729.6867-1-tatsunosuke.wacom@gmail.com>
Subject: Re: [PATCH] HID: wacom: Remove AES power_supply after extended
 inactivity
Message-Id: <170185151858.57786.7346117978758271248.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 09:31:58 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Wed, 15 Nov 2023 08:57:29 +0900, Tatsunosuke Tobita wrote:
> Even if a user does not use their AES pen for an extended period,
> the battery power supply attributes continue to exist.
> This results in the desktop showing battery status for a pen
> that is no longer in use and which may in fact be in a different
> state (e.g. the user may be charging the pen).
> To avoid confusion and ensure userspace has an accurate view
> of the battery state, this patch automatically removes
> the power_supply after 30 minutes of inactivity.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.8/wacom), thanks!

[1/1] HID: wacom: Remove AES power_supply after extended inactivity
      https://git.kernel.org/hid/hid/c/fd2a9b29dc9c

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


