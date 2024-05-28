Return-Path: <linux-input+bounces-3891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D358D140A
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 07:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28D752829CE
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 05:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CC74501E;
	Tue, 28 May 2024 05:46:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA8AF4EB
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875165; cv=none; b=OXNFLP+vhX+TjJk/ObvZCIyiZpr2ci98jQg33wEa6U9cjHQS4h39i6EP8CUcR6bfpROmTdglWrNnaXgxJa8Uy2eqigdC0JA53Gxz9EroXHoAlmytiic+k04QLDlnlNBAgOgNFMBIVF1MelNDEjC13jiap/vrr8Y9w3OmXtarYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875165; c=relaxed/simple;
	bh=LNkqndWFKuEPPX1JaqqLndR2tb1JhYcgfZC2a28QYxo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kbBT6g1wy/rSlnTwvEoctOFBBt4nihsGmRiYEEJG8pNx/RuIIGnkEQIi18nju+NPOvrGsQlawGto0Ww/BPFLn8ZsTRQZDCXrFo9vyeKg382ZVdKg0+h0CFejvvlw2XXxl3eq8+2G7Ky+ERmfjf8siX2+Ve83uJza6Q95a754aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7eada05bd3bso47703939f.0
        for <linux-input@vger.kernel.org>; Mon, 27 May 2024 22:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716875163; x=1717479963;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E1y9AJP/hTWyZH3gbZVFiRkUty28djm2NEmsgQlkRs=;
        b=YoxkvDg5DAKZihvxOkunkIobFyH7qchYClvHmfyDly8nzOCEw7bFKnvjYVe9dVEX5v
         f0P0ZJ5+k69NsN2xoOMOukwbP5tuK9RHIhfze4+PMGpWcPufuPJaqH1tD+stIoqzYDJ8
         fbb5Q2sfQDG8tiqCHzokc9o59MuzU1aFrNPAx1xV/IrqaQD6UxA3FkKDX8fyVZ7//o78
         FSsf86nj61S3juWXtVlOVCrdDl7u4sEpwzMh+jI3S7vvv/63Sugk7bEkZlSmTfWDPf+e
         9zkDkihFKqTZfGAi5eZWQiGkJmPjbRqrBiMiLGsi8TYYHInAs7/TvwA2/mNjkuHY1Q0r
         aLEw==
X-Forwarded-Encrypted: i=1; AJvYcCXMIFc2w7FV5IN59/Bb13z35Z5gGxVLQTUGMp9GZTRm4Sq+nVTtXencCtpOGBGbfH8yhCAmIeC/SS3Ax7RRXtarYJiwCEo2u3i83VQ=
X-Gm-Message-State: AOJu0YyTnrq0MnzkGqMWXndIGs+IuPCZaXbqEqBsG0inlzFyru8+DJL3
	9SuanY+YO9wkUbL8Sk1+SgBebAwHQeVvwguZSMe7qE0bnB9JTOCA3T3tFmd6IkfXEadmqnbTzmp
	sKc+LbIH97YL+nRwSrMQAfKYa+FwpZurxFznXC0bt61y/RRPPey8OYOA=
X-Google-Smtp-Source: AGHT+IEu7seloMCjyJ37Unc4OUdBZCbo1oPrf1l7686Q+DcxBOuBUTphC7dUHPfp2nbVgS5WnWslQ7f5q6EH6uewR5bQMJN3pbUt
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a41:b0:36d:d38e:3520 with SMTP id
 e9e14a558f8ab-3737b33d769mr9351795ab.4.1716875163203; Mon, 27 May 2024
 22:46:03 -0700 (PDT)
Date: Mon, 27 May 2024 22:46:03 -0700
In-Reply-To: <20240528050555.1150628-1-andrewjballance@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a07b706197d2695@google.com>
Subject: Re: [syzbot] [input?] [usb?] KMSAN: uninit-value in asus_report_fixup
From: syzbot <syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com>
To: andrewjballance@gmail.com, benjamin.tissoires@redhat.com, 
	bentiss@kernel.org, jikos@kernel.org, jkosina@suse.com, 
	linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luke@ljones.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

sert=3Don, ref-verify=3Don, zoned=3Dyes, fsverity=3Dyes
[   50.230614][    T1] Key type encrypted registered
[   50.235891][    T1] AppArmor: AppArmor sha256 policy hashing enabled
[   50.242800][    T1] ima: No TPM chip found, activating TPM-bypass!
[   50.249865][    T1] Loading compiled-in module X.509 certificates
[   50.292391][    T1] Loaded X.509 cert 'Build time autogenerated kernel k=
ey: 2ef82123926fa34f508acba9911fce577bb4fe8a'
[   50.303920][    T1] ima: Allocated hash algorithm: sha256
[   50.310144][    T1] ima: No architecture policies found
[   50.316925][    T1] evm: Initialising EVM extended attributes:
[   50.322973][    T1] evm: security.selinux (disabled)
[   50.328526][    T1] evm: security.SMACK64 (disabled)
[   50.334013][    T1] evm: security.SMACK64EXEC (disabled)
[   50.339602][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[   50.345640][    T1] evm: security.SMACK64MMAP (disabled)
[   50.351386][    T1] evm: security.apparmor
[   50.355851][    T1] evm: security.ima
[   50.359745][    T1] evm: security.capability
[   50.364417][    T1] evm: HMAC attrs: 0x1
[   50.373466][    T1] PM:   Magic number: 8:208:619
[   50.379889][    T1] usb usb14-port4: hash matches
[   50.386279][    T1] net ifb0: hash matches
[   50.391057][    T1] tty ptye9: hash matches
[   50.396054][    T1] tty ptybc: hash matches
[   50.401524][    T1] printk: legacy console [netcon0] enabled
[   50.407774][    T1] netconsole: network logging started
[   50.414999][    T1] gtp: GTP module loaded (pdp ctx size 128 bytes)
[   50.424381][    T1] rdma_rxe: loaded
[   50.430039][    T1] cfg80211: Loading compiled-in X.509 certificates for=
 regulatory database
[   50.451536][    T1] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   50.469189][    T1] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06=
c7248db18c600'
[   50.477773][    T1] clk: Disabling unused clocks
[   50.482816][    T1] ALSA device list:
[   50.486809][    T1]   #0: Dummy 1
[   50.490724][    T1]   #1: Loopback 1
[   50.494616][    T1]   #2: Virtual MIDI Card 1
[   50.505678][   T10] platform regulatory.0: Direct firmware load for regu=
latory.db failed with error -2
[   50.506128][    T1] md: Waiting for all devices to be available before a=
utodetect
[   50.517296][   T10] platform regulatory.0: Falling back to sysfs fallbac=
k for: regulatory.db
[   50.524217][    T1] md: If you don't use raid, use raid=3Dnoautodetect
[   50.540178][    T1] md: Autodetecting RAID arrays.
[   50.545383][    T1] md: autorun ...
[   50.549388][    T1] md: ... autorun DONE.
[   50.671837][    T1] EXT4-fs (sda1): mounted filesystem 5941fea2-f5fa-4b4=
e-b5ef-9af118b27b95 ro with ordered data mode. Quota mode: none.
[   50.685698][    T1] VFS: Mounted root (ext4 filesystem) readonly on devi=
ce 8:1.
[   50.779387][    T1] devtmpfs: mounted
[   51.037410][    T1] Freeing unused kernel image (initmem) memory: 37032K
[   51.049223][    T1] Write protecting the kernel read-only data: 262144k
[   51.096766][    T1] Freeing unused kernel image (rodata/data gap) memory=
: 1808K
[   52.746982][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   52.757511][    T1] x86/mm: Checking user space page tables
[   54.254031][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   54.263213][    T1] Failed to set sysctl parameter 'kernel.hung_task_all=
_cpu_backtrace=3D1': parameter not found
[   54.285036][    T1] Failed to set sysctl parameter 'max_rcu_stall_to_pan=
ic=3D1': parameter not found
[   54.296902][    T1] Run /sbin/init as init process
[   55.866548][ T4446] mount (4446) used greatest stack depth: 8144 bytes l=
eft
[   55.941342][ T4447] EXT4-fs (sda1): re-mounted 5941fea2-f5fa-4b4e-b5ef-9=
af118b27b95 r/w. Quota mode: none.
mount: mounting smackfs on /sys/fs/smackfs failed: No such file or director=
y
mount: mounting selinuxfs on /sys/fs/selinux failed: No such file or direct=
ory
[   56.283370][ T4450] mount (4450) used greatest stack depth: 5568 bytes l=
eft
Starting syslogd: OK
Starting acpid: OK
Starting klogd: OK
Running sysctl: OK
Populating /dev using udev: [   60.169672][ T4480] udevd[4480]: starting ve=
rsion 3.2.11
[   63.755909][ T4481] udevd[4481]: starting eudev-3.2.11
[   63.769352][ T4480] udevd (4480) used greatest stack depth: 5272 bytes l=
eft
done
Starting system message bus: done
Starting iptables: OK
Starting network: OK
Starting dhcpcd...
dhcpcd-9.4.1 starting
dev: loaded udev
DUID 00:04:c7:fd:4a:df:9d:a6:e9:60:55:7b:b4:5b:1f:77:00:5c
forked to background, child pid 4693
[  111.458895][ T4694] 8021q: adding VLAN 0 to HW filter on device bond0
[  111.496440][ T4694] eql: remember to turn off Van-Jacobson compression o=
n your slave devices
[  111.697880][   T10] cfg80211: failed to load regulatory.db
Starting sshd: [  113.751142][ T4779] sshd (4779) used greatest stack depth=
: 4720 bytes left
[  113.792885][    C0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  113.800595][    C0] BUG: KMSAN: uninit-value in receive_buf+0x25e3/0x5fd=
0
[  113.807866][    C0]  receive_buf+0x25e3/0x5fd0
[  113.812660][    C0]  virtnet_poll+0xd1c/0x23c0
[  113.817511][    C0]  __napi_poll+0xe7/0x980
[  113.822060][    C0]  net_rx_action+0x82a/0x1850
[  113.827121][    C0]  handle_softirqs+0x1ce/0x800
[  113.832171][    C0]  __irq_exit_rcu+0x68/0x120
[  113.837029][    C0]  irq_exit_rcu+0x12/0x20
[  113.841544][    C0]  common_interrupt+0x94/0xa0
[  113.846507][    C0]  asm_common_interrupt+0x2b/0x40
[  113.851825][    C0]  kmsan_internal_set_shadow_origin+0x76/0xe0
[  113.858320][    C0]  kmsan_internal_unpoison_memory+0x14/0x20
[  113.864659][    C0]  kmsan_unpoison_memory+0x28/0x40
[  113.869970][    C0]  prep_new_page+0x115/0x540
[  113.874876][    C0]  get_page_from_freelist+0x1578/0x15f0
[  113.880730][    C0]  __alloc_pages_noprof+0x8a7/0xe70
[  113.886250][    C0]  alloc_pages_mpol_noprof+0x299/0x990
[  113.892181][    C0]  vma_alloc_folio_noprof+0x412/0x750
[  113.898206][    C0]  handle_mm_fault+0x907c/0xe610
[  113.903457][    C0]  exc_page_fault+0x41b/0x700
[  113.908439][    C0]  asm_exc_page_fault+0x2b/0x30
[  113.913577][    C0]=20
[  113.916067][    C0] Uninit was created at:
OK[  113.920879][    C0]  __alloc_pages_noprof+0x9d6/0xe70

[  113.926417][    C0]  alloc_pages_mpol_noprof+0x299/0x990
[  113.932200][    C0]  alloc_pages_noprof+0x1bf/0x1e0
[  113.937655][    C0]  skb_page_frag_refill+0x2bf/0x7c0
[  113.943288][    C0]  virtnet_rq_alloc+0x43/0xbb0
[  113.948380][    C0]  try_fill_recv+0x3f0/0x2f50
[  113.953224][    C0]  virtnet_open+0x1cc/0xb00
[  113.958077][    C0]  __dev_open+0x546/0x6f0
[  113.962708][    C0]  __dev_change_flags+0x309/0x9a0
[  113.968302][    C0]  dev_change_flags+0x8e/0x1d0
[  113.973240][    C0]  devinet_ioctl+0x13ec/0x22c0
[  113.978437][    C0]  inet_ioctl+0x4bd/0x6d0
[  113.983181][    C0]  sock_do_ioctl+0xb7/0x540
[  113.987928][    C0]  sock_ioctl+0x727/0xd70
[  113.992433][    C0]  __se_sys_ioctl+0x261/0x450
[  113.997393][    C0]  __x64_sys_ioctl+0x96/0xe0
[  114.002313][    C0]  x64_sys_call+0x18c0/0x3b90
[  114.007248][    C0]  do_syscall_64+0xcd/0x1e0
[  114.011927][    C0]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  114.018164][    C0]=20
[  114.020697][    C0] CPU: 0 PID: 4786 Comm: rm Not tainted 6.10.0-rc1-syz=
kaller-00013-g2bfcfd584ff5-dirty #0
[  114.031264][    C0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/02/2024
[  114.041826][    C0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  114.049359][    C0] Disabling lock debugging due to kernel taint
[  114.055708][    C0] Kernel panic - not syncing: kmsan.panic set ...
[  114.062795][    C0] CPU: 0 PID: 4786 Comm: rm Tainted: G    B           =
   6.10.0-rc1-syzkaller-00013-g2bfcfd584ff5-dirty #0
[  114.075000][    C0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/02/2024
[  114.085286][    C0] Call Trace:
[  114.088865][    C0]  <IRQ>
[  114.091913][    C0]  dump_stack_lvl+0x216/0x2d0
[  114.096785][    C0]  ? kmsan_get_shadow_origin_ptr+0x4d/0xb0
[  114.102924][    C0]  dump_stack+0x1e/0x30
[  114.107269][    C0]  panic+0x4e2/0xcd0
[  114.111426][    C0]  ? kmsan_get_metadata+0x111/0x1d0
[  114.116837][    C0]  kmsan_report+0x2d5/0x2e0
[  114.121549][    C0]  ? kmsan_alloc_page+0x182/0x220
[  114.126772][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.132180][    C0]  ? __msan_warning+0x95/0x120
[  114.137205][    C0]  ? receive_buf+0x25e3/0x5fd0
[  114.142074][    C0]  ? virtnet_poll+0xd1c/0x23c0
[  114.147049][    C0]  ? __napi_poll+0xe7/0x980
[  114.151760][    C0]  ? net_rx_action+0x82a/0x1850
[  114.156910][    C0]  ? handle_softirqs+0x1ce/0x800
[  114.161958][    C0]  ? __irq_exit_rcu+0x68/0x120
[  114.166911][    C0]  ? irq_exit_rcu+0x12/0x20
[  114.171601][    C0]  ? common_interrupt+0x94/0xa0
[  114.176565][    C0]  ? asm_common_interrupt+0x2b/0x40
[  114.181863][    C0]  ? kmsan_internal_set_shadow_origin+0x76/0xe0
[  114.188207][    C0]  ? kmsan_internal_unpoison_memory+0x14/0x20
[  114.194391][    C0]  ? kmsan_unpoison_memory+0x28/0x40
[  114.199793][    C0]  ? prep_new_page+0x115/0x540
[  114.204666][    C0]  ? get_page_from_freelist+0x1578/0x15f0
[  114.210579][    C0]  ? __alloc_pages_noprof+0x8a7/0xe70
[  114.216060][    C0]  ? alloc_pages_mpol_noprof+0x299/0x990
[  114.221983][    C0]  ? vma_alloc_folio_noprof+0x412/0x750
[  114.227836][    C0]  ? handle_mm_fault+0x907c/0xe610
[  114.233178][    C0]  ? exc_page_fault+0x41b/0x700


[  114.238164][    C0]  ? asm_exc_page_fault+0x2b/0x30
[  114.243578][    C0]  ? kmsan_internal_memmove_metadata+0x17b/0x230
syzkaller[  114.250182][    C0]  ? kmsan_get_metadata+0x146/0x1d0

[  114.256633][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.262332][    C0]  ? page_to_skb+0xdae/0x1620
[  114.267233][    C0]  __msan_warning+0x95/0x120
[  114.272275][    C0]  receive_buf+0x25e3/0x5fd0
[  114.277094][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.282402][    C0]  ? kmsan_get_shadow_origin_ptr+0x4d/0xb0
[  114.288519][    C0]  virtnet_poll+0xd1c/0x23c0
[  114.293235][    C0]  ? __pfx_virtnet_poll+0x10/0x10
[  114.298573][    C0]  __napi_poll+0xe7/0x980
[  114.303042][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.308529][    C0]  net_rx_action+0x82a/0x1850
[  114.313443][    C0]  ? sched_clock_cpu+0x55/0x870
[  114.318434][    C0]  ? __pfx_net_rx_action+0x10/0x10
[  114.323766][    C0]  handle_softirqs+0x1ce/0x800
[  114.328788][    C0]  __irq_exit_rcu+0x68/0x120
[  114.333488][    C0]  irq_exit_rcu+0x12/0x20
[  114.337976][    C0]  common_interrupt+0x94/0xa0
[  114.343068][    C0]  </IRQ>
[  114.346080][    C0]  <TASK>
[  114.349188][    C0]  asm_common_interrupt+0x2b/0x40
[  114.354554][    C0] RIP: 0010:kmsan_internal_set_shadow_origin+0x76/0xe0
[  114.361736][    C0] Code: f0 83 e0 03 49 83 e6 fc 49 8d 5c 07 03 4c 89 f=
7 be 01 00 00 00 e8 3a 35 00 00 48 83 fb 04 72 1a 48 c1 eb 02 31 c9 44 89 2=
c 88 <ff> c1 48 63 c9 48 39 cb 77 f2 eb 04 84 db 75 0f 5b 41 5c 41 5d 41
[  114.382246][    C0] RSP: 0000:ffff88812094b8b0 EFLAGS: 00000216
[  114.388520][    C0] RAX: ffff8881212ed000 RBX: 0000000000000400 RCX: 000=
000000000019b
[  114.396599][    C0] RDX: 00000001216ed000 RSI: ffff88813fff9240 RDI: fff=
f8881216ed000
[  114.404856][    C0] RBP: ffff88812094b8d8 R08: ffffea000000000f R09: 000=
0000000000000
[  114.413096][    C0] R10: ffff888120eed000 R11: 0000000000000004 R12: 000=
0000000000000
[  114.421164][    C0] R13: 0000000000000000 R14: ffff8881216ed000 R15: 000=
0000000001000
[  114.429361][    C0]  kmsan_internal_unpoison_memory+0x14/0x20
[  114.435481][    C0]  kmsan_unpoison_memory+0x28/0x40
[  114.441106][    C0]  prep_new_page+0x115/0x540
[  114.445833][    C0]  ? kmsan_get_shadow_origin_ptr+0x4d/0xb0
[  114.451866][    C0]  get_page_from_freelist+0x1578/0x15f0
[  114.457804][    C0]  __alloc_pages_noprof+0x8a7/0xe70
[  114.463144][    C0]  alloc_pages_mpol_noprof+0x299/0x990
[  114.469050][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.474479][    C0]  vma_alloc_folio_noprof+0x412/0x750
[  114.480070][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.485509][    C0]  handle_mm_fault+0x907c/0xe610
[  114.491145][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.496501][    C0]  ? kmsan_get_metadata+0x146/0x1d0
[  114.501877][    C0]  exc_page_fault+0x41b/0x700
[  114.506694][    C0]  asm_exc_page_fault+0x2b/0x30
[  114.511959][    C0] RIP: 0033:0x7fbc8aec8b9d
[  114.517011][    C0] Code: 8b 90 c8 01 00 00 48 81 e2 00 ff ff ff 7e 14 4=
8 89 d1 48 89 15 94 e6 10 00 48 d1 f9 48 89 0d 92 e6 10 00 48 8b 90 d0 01 0=
0 00 <48> 89 15 24 58 11 00 48 8b 90 d8 01 00 00 48 89 15 66 e6 10 00 48
[  114.536844][    C0] RSP: 002b:00007fffd2152068 EFLAGS: 00010206
[  114.543432][    C0] RAX: 00007fbc8b0dfa80 RBX: 00007fbc8ae35000 RCX: 000=
0000000dc0000
[  114.551697][    C0] RDX: 00000000014a0000 RSI: 00007fbc8ae53540 RDI: 000=
0000000000000
[  114.559908][    C0] RBP: 00007fffd2152170 R08: 00007fffd2150000 R09: 000=
07fbc8b0e0ab0
[  114.568160][    C0] R10: 00007fbc8ae39ab8 R11: 0000000000000025 R12: 000=
07fbc8b0a95c0
[  114.576260][    C0] R13: 00007fbc8b0d4eda R14: 00007fbc8afd68c8 R15: 000=
07fbc8ae39ab8
[  114.584358][    C0]  </TASK>
[  114.587837][    C0] Kernel Offset: disabled
[  114.592358][    C0] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.21.4'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1371669175=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at c0f1611a3
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dc0f1611a36d66bb0bb8e2f294b97fb685bfc5f9c -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20240517-125934'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-fuzzer=
 github.com/google/syzkaller/syz-fuzzer
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dc0f1611a36d66bb0bb8e2f294b97fb685bfc5f9c -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20240517-125934'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
gcc -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -std=3Dc++11 -I. -Iexecutor/_include -O2 -pthread -Wall -Werror -Wpar=
entheses -Wunused-const-variable -Wframe-larger-than=3D16384 -Wno-stringop-=
overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variabl=
e -Wno-unused-command-line-argument -static-pie -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"c0f1611a36d66bb0bb8e2f294b97fb685b=
fc5f9c\"


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D15a9822c980000


Tested on:

commit:         2bfcfd58 Merge tag 'pmdomain-v6.10-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D54d66e52f38a45d=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3D07762f019fd03d01f=
04c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1425c62c9800=
00


