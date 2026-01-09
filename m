Return-Path: <linux-input+bounces-16911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB1D0C1FD
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 20:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5B24302F2C1
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 19:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47EB364032;
	Fri,  9 Jan 2026 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1rWaxoj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A135E55E
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767988706; cv=none; b=LQU32DDTsrl3/A1OVVdEtigEARncQ2iGHh3Nan5BxaWEwP67vyamak6siEKVwClACGF/f1xbzYJe8htfRbn4ALLS3l3wrpL98Q14By6tGPhrBCwWt0xfGXgpmdie5Jy7EjNDPWIVvmEPddfhTvqDF0boNyuMIynZIbFZKm77pYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767988706; c=relaxed/simple;
	bh=N4mI29kLpsMIsx6SXly8DxbxF9Em3XWcDPorGzytv50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVhUIzRJFGRkvc0EYiiXejsxDFYfHPAUYXU/oxjanhuWHyI5g2VD4rgMQ3xqs6mVKDyVn8F6zDt+HoPpsrQq0vq4biplOgCKFf6ZHqdW3bURgd5+KmFuPqCrpwIVzfP/qFdmOnEP/PN6E45Gs7satPCv+Wmko/b1YsTjBkxzMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1rWaxoj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2445397f8f.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 11:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767988703; x=1768593503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QMmqijmW5OEj9rhjII4BzCWp+Fe1yVoyJR9EVAR0Ao=;
        b=D1rWaxojD+iNYfTchLan/Zqt1m/LgCZLa/uvlGCGOaANqvlJN5C3Cox1oex36CeQs7
         M8DPEIp0FVDFuc/fDEHoJ/kPlB8k8w5jxwtTtel8F31Drakwx5rVwZ73G/GEZXRVudOQ
         exPNdu6dCINiiUv8PYQ+ga9dKBLKAnR90D7UnERzolUeO6oHnHbhm+MiWBMoBPVb4YFi
         aYSN2pCLRQUFZXEjmBupw0Lfqwe9Dz0PYz5b6HPrEY8nso0pSTQgiLjVrPHynv35ZW6g
         ahYTVoTypXeKjWJmTzybHFt82Vj4Ax4WBP6O1J0DAA/gcqdvh3CRbN0PEEVKUFpY4haw
         ZwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767988703; x=1768593503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5QMmqijmW5OEj9rhjII4BzCWp+Fe1yVoyJR9EVAR0Ao=;
        b=OVKiRka8F1Z11QMfk4KDy56nTuHkS2eYhsxAMOalIv0UNJDsPBA78CcpTmsXZyyKhW
         V9GbYC81UMN7BXnyhXG1sTw0fGrttVIhrGf/euxm0M26SiVeTTyGVUTt2xf24y7vILba
         MKoOrLS3tf0W1RaZugq/zNITTxqSxIeqC2Yuyy1mXymuB5wS98Y9p1RIOWfUC70FsDCj
         jOjcIK3Q339f5wkvGNZvBsP+6waaSzunKn0pRJjUHofk6Bgk4kBDXXPXjOnMBEefdCMD
         HhgifA0evSE6nwrvEDM4OsjyVTxKcnHECav6M5zAqBNEjZ5I8zoccxS2S1b+gfuPCa2R
         xVHA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKF15c87SKWvSeHTOBNr8IUmqSI9JjAvXjQYpkmk3KzWRrIaK5+9QMO1lCWOVSVFImb6yL2X4lYlBpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylCZ2IKxTgE07Q9vEL8pwJt71Lsm5qSpjErQtDnHJxN+K8bPKX
	ZQCjhXULcG1IkourdKCxfgso6u+EnpVKUGKwsZJjBhB1r+LPNmrv+pfK0MeDHvVEs+5wQ20UFg9
	Po0VBnQQQjPiTqtZEqFD8PfgXOt2HyFs=
X-Gm-Gg: AY/fxX4BLWnG9Xkpb7Mk/NEpbxT2gLcXoWYBrFlDudCZifU1ie5+sNk0t5uLGWUI/b/
	2DNETEDTC2VTar2pJSQu/66dVT5GC/mbtEqMG12CLa9Uq/jB8nUzQPCCXteU3tU09iUOKrfUUeI
	A1i1QNwousAsaYdIBXX3zX/JCwE9aqW2EYUxWzdYTaZ3rcS/dOlwK2+NL7WLTYV7RsOevm2kIos
	2YXGimCO+npXTdr9bXtn/26Wsw54L0bXOhWMqvBYu45z/qkcYviqetQrVWNOj6Wotdc8u0/Dp2z
	sFm103q0O51+7HcyWU7uUOU1P9oUbmXNt6Ij2IU=
X-Google-Smtp-Source: AGHT+IH31/5/AxLt/GFD0JXqk5ipU8sqfkp5h+qHZjIKs/6CrSBkE8wuiyerR6wM7rrW0+Av3p0KHNxlHiPDHCtG/oI=
X-Received: by 2002:a05:6000:2882:b0:42b:55a1:214c with SMTP id
 ffacd0b85a97d-432c37c1462mr11155555f8f.55.1767988703249; Fri, 09 Jan 2026
 11:58:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev> <20260109184852.1089786-9-ihor.solodrai@linux.dev>
In-Reply-To: <20260109184852.1089786-9-ihor.solodrai@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 Jan 2026 11:58:11 -0800
X-Gm-Features: AZwV_QhLHY-bzxGEAgmV-qRTyW82SDVPwuXlSXHHrs1ojOutmV1JrhtE-366It8
Message-ID: <CAADnVQJDv80_T+1jz=7_8y+8hRTjMqqkm38in2er8iRU-p9W+g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 08/10] bpf: Add bpf_task_work_schedule_*
 kfuncs with KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:50=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> +__bpf_kfunc int bpf_task_work_schedule_signal(struct task_struct *task, =
struct bpf_task_work *tw,
> +                                             void *map__map, bpf_task_wo=
rk_callback_t callback,
> +                                             struct bpf_prog_aux *aux)
> +{
> +       return bpf_task_work_schedule(task, tw, map__map, callback, aux, =
TWA_SIGNAL);
> +}
> +
>  __bpf_kfunc int bpf_task_work_schedule_signal_impl(struct task_struct *t=
ask,
>                                                    struct bpf_task_work *=
tw, void *map__map,
>                                                    bpf_task_work_callback=
_t callback,
>                                                    void *aux__prog)
>  {
> -       return bpf_task_work_schedule(task, tw, map__map, callback, aux__=
prog, TWA_SIGNAL);
> +       return bpf_task_work_schedule_signal(task, tw, map__map, callback=
, aux__prog);
>  }

I thought we decided that _impl() will not be marked as __bpf_kfunc
and will not be in BTF_ID(func, _impl).
We can mark it as __weak noinline and it will be in kallsyms.
That's all we need for the verifier and resolve_btfid, no?

Sorry, it's been a long time. I must have forgotten something.

