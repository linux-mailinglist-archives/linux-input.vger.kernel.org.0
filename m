Return-Path: <linux-input+bounces-15765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A243C11C36
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 23:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2992188F59E
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 22:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4E0336EDD;
	Mon, 27 Oct 2025 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6M2OCbK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA732C93B;
	Mon, 27 Oct 2025 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604502; cv=none; b=gSYigFFkygoQdWojRE9VBJ3ZyTaMdNY8TxfdUwMXqIN/b6A0NcY3ZKKuRoXtGfTtFoidTBrCb42jjJvHHygv0aWi3XuyOSCHIlUduiUpGXPAw2hWqiWzd0qQZINJ3xphFvh5HjI51CY5lqFiUWOu1KOKYPbYvCjbl5zx/UxJTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604502; c=relaxed/simple;
	bh=IFwuIvM0P2ooBTclpmGXVYbg8LuiinGYPcrAjgnrRmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A06/QY96t6yXNC09QTD7xQnK4bWymvtWpeBbyzsM4FEvRs5X1CuMkl3x/cSi83qB3fUlxHc+jRqZP6xYUawT4ahyTZdvrtczHp6K/HQMBu83UaTcK6Texgl/CXq5u1m17XRXiN1a+zr+VhoJCeIdHfokyr/0y9QvLIwNo46038A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6M2OCbK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FDDC116D0;
	Mon, 27 Oct 2025 22:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604502;
	bh=IFwuIvM0P2ooBTclpmGXVYbg8LuiinGYPcrAjgnrRmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6M2OCbKMaWbKdlrjU9ffUN9tf9dN8nUFYxz3CgYpFZ3FmtzhPfU6fFCUF/jDYQSo
	 JhpHKOkbtNaJiQdwFK4CQJLGI6lnMzsxRgIrEU03Fn1ZxpUhDE2VLxECDwX7m27kpi
	 QbD7QNFbIJJKbYXd19x46xfIczGTZ53y6uNe+FBaD/LZUr9J3UrWysf3kuLiQpYCob
	 dPlWfrcdEWUoBXrXP21zGrvKvwmWU0ajVSegYUWxqA+qtIakMNgQgcdV9KTxh+y+WX
	 VR05GJwNeGwspwP76s/rBjPz5nYQqWczDMOonrVyTQRIIDLYTFYCJaKmBzdZT8Hh+6
	 h5BnvYh2sOIiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
Date: Mon, 27 Oct 2025 17:36:56 -0500
Message-ID: <176160465196.73268.9063227236058327728.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925-aw86927-v3-3-1fc6265b42de@fairphone.com>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com> <20250925-aw86927-v3-3-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Sep 2025 12:07:30 +0200, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86927).
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
      commit: ebb14a39c059694b588fc71bde72f88f9e72a11c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

