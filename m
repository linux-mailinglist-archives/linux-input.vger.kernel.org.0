Return-Path: <linux-input+bounces-11470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BCA78969
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 10:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585C116F9A8
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 08:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A1B1F1507;
	Wed,  2 Apr 2025 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="j86SPPYo"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2A2F5A;
	Wed,  2 Apr 2025 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581012; cv=none; b=VcJY6oEQor52LxuB/b+dkXbW3yDJcfY/E7P6cSErLgCQxBQRx6QfTeiZa+VuNH08jdD70939dRtiEkIHF+ps8KblbKOKjY7YhvmchSumNcEmTZQYfAy6ogTv/ymD1PogBxBOM2TynrV01f47zuP3fdMWUScma5ryxlFdui5m4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581012; c=relaxed/simple;
	bh=qGB7dzW9PSanqFpaSbGxQtSOv1FhWKxASFZi93co2CM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hHGa8xd3FhaZdYF9fW+iFKH06EXx9rfmvqIiUlbir4JiQN9P2UKkCc3lvZbWh9wi2vkCUZbT7P38rJwxH90OFCmq6C+sf9I+LKogQU8K3J+7i7OU8qOE/tUXhhjFK2+nQrUU8KCjw9qScSxw0jqDoTqvp55OdjbnQGO91gQunCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=j86SPPYo; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743581006; x=1744185806; i=markus.elfring@web.de;
	bh=qGB7dzW9PSanqFpaSbGxQtSOv1FhWKxASFZi93co2CM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=j86SPPYoH88VNTePktAyUyUF1OdTyO7G1L+L30JvIbTD/1rTCUHQJWCSQQuNTSLJ
	 maf1vYqz8YVi4fOUBjBeY1vAYTq82J0bufLLi1mVR0rl298gBvJaXa+JQcoLLRqeC
	 4vbWeA+illK/wVAlCmcM3EV1x28yM0qSRoXzr+yFURi/bNomid2SFdIpSeAHXcK64
	 H5M44u/ssnqZKNNce3qmiikPYWKVg0Xjf5FEUozNUyap4AWksswfvcMnDFjpvr+wU
	 xVwFjF8WjzwpILM9YU5d7HgRrmt9gKSSi2o9vf61T9Y/klj9Mc021YWG6F2WuxiAF
	 lqjHzuTBYLrtjuUR/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MF2gM-1ttGJ40zkW-009yEU; Wed, 02
 Apr 2025 10:03:26 +0200
Message-ID: <1f6f6fe9-ae81-4154-8553-dfb4ca2b1cd2@web.de>
Date: Wed, 2 Apr 2025 10:03:25 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Jason Gerecke <jason.gerecke@wacom.com>, Jiri Kosina <jikos@kernel.org>,
 Ping Cheng <ping.cheng@wacom.com>
References: <20250401214703.7809-1-qasdev00@gmail.com>
Subject: Re: [PATCH v2] HID: wacom: fix shift OOB in kfifo allocation for zero
 pktlen
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401214703.7809-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o/6B0FvTT9u0XYZVmXUikdrZbKXRw8/Ux3fKopM1xFUH3LkF2rV
 X0Q+FEQ0CeMJj5fVs4Kx7r4SCLr2tX57ua7WndqCQ3xywrWOQZRbvqsLGxpAlK50dbMQoTJ
 xIWl4r+iuZgl+57uGpVmbqxbzmS9x9Dub8qjZSDr7srd3KpFZXPyz9C2W8HwnZ/xEPk4gq4
 G3owzUk0JDe85/EDWxHnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cezQpm+aQ+Q=;ZQ+Yi0ycYWYtl/sfyE77YU31tne
 VvwzCJ6RY/FYFVEqXoDqmMQbvmCF+SGgY4dLCP+c+EdoHzuyj/rmpwrKtEGu5GDSBGDUa9x6X
 liGbZ7AQ3J0cXzB3XfvMP72doFtK8F3rcZu14LXGmSUyeb0BO1H+1Ad9N9QbGc08S0qHLa1Z4
 e1y4Br9vMbmvWNgR8H2J3EKAGBdvWI+wrz3/6myUxuIB8cwCm1q3eDpQUqWJ1xufZUsHqQ1m6
 lgwzP/GnQ/L9IG962RAmRh903WBXssaIDXNv2MnC1bDhooGQ5NBNt0PPYbK728NGel+r3fMdT
 FBYey9iIuFb/il/0lISSJd9CCgA8NYChhLY8qjSHqJwF4YaRAhufRUpix6QQeGTRWkSh2YZFF
 51MPLuelRy4aFyIHOpA/s1juej9gskhKAjGTSQOdtBbNWuXPfJR8mgT4ElhXECIbyh/GI2cwd
 moeVga3bjBTr6Bjh8naOSSPcokj3XaAWmyhxIgh5YzgcP6acvDWxxmVwofuYlX1HjeqUL5v3H
 eE5U/GYhfWiAYxq6JcUITsxJvZEOz+/Uvw+VQkwvbrY92ivkICTRJWb3JY/tvZMBMjo33pvKs
 c8pcLNNosmA+OKCyIjSNoaRopGCDOiqQkA+JOCs2gs4jNl1mMBeapzD9yYnXk82isWIcDAkIm
 uk+2hs3qguMTgdZzJp7nJvSNUzEdP3PyPsrcOeuYUt/H+/uJqb4JxUSa2517HFzh7js89vWKK
 LS+009hXNS2ue+KG9eeQ7IWPdkeo1ne7RFgh5sqqShSQ8aDsOhZ6EOL/7zQdPW/E5lJiPvtAU
 cWs719vTLPLu+jxx46nlYnGWW+cgSXaYUltSollrx04tbi9kJQx019Q57uzXSihgR9whCIYOo
 cKMX2BuGfyoaiUI9uRCU6EdQVNx4sEK5pdBsIKAq8oDBW1IaXdLSLf5TR1qic+uyvnXvmLoS6
 QV2ybQ/kHPzqK7m6pLKaVdtQ5oNlcaPxhu48oFy4EAsKSzyNKoWM9CpJkbCEV56P8/jRbm9j8
 PKzQ0J1ZeZSLEiXe3NfIHKrfqpBVTvsJsCfLlXAFiUWHUh7RvzlOYiU+r3zQm5vGGOeaI4hba
 ZKOgfEbteTC+kp+PDbI+xVTX7ShHeW3f+x2+mwHOsTYidLl8D4ddy5+C6vXroBfrBEMG9ggcr
 NJlBYJgPCjZ/T7ozGniBs8wfBrBMYxG6U0/pRkylhc21uwll78d3GTn9/Esfsxt4wxSnyMqXg
 VyupxyTMyS+UpmUtjtVgSYqZoyEURh995BperCCmd21WK//bTrEptZDdn243jUu87HIbp5iyP
 g/i/hs5MNLBxH1VxVajATUGDgOPo/DGFgweCXlwIVEymCV/44K0xZSeLmdUoPFml0yU2J/E+q
 TDA65hjzy8jwYDhUsVFAnYVv/vvQPRxtUb8ggmt9+K3fW46GfmHhcH8K0E2lzbouDtDSUHINT
 ZTbbZ94CFfSw7i+nQEgJrP+HnYRrSLWZg4G0+5Lw4e0v6LyaCtYOa4QDynUAM0JfV0rAq/g==

=E2=80=A6
> To fix this, we should handle cases where wacom_compute_pktlen()
> results in 0.

See also once more:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94

Regards,
Markus

